import crypto from "node:crypto";
import { execFileSync } from "node:child_process";
import { createRequire } from "node:module";
import { mkdirSync, mkdtempSync, readFileSync } from "node:fs";
import { join } from "node:path";

const root = new URL("..", import.meta.url).pathname;
const output = "/tmp/hx-opencv-release-consumer.js";
const manifest = JSON.parse(readFileSync(join(root, "manifest/opencv-5.0.0.json"), "utf8"));
const bundle = readFileSync(join(root, "lib/opencv.js"));
const sha256 = crypto.createHash("sha256").update(bundle).digest("hex");
if (sha256 !== manifest.bundle.sha256) throw new Error(`bundle hash differs from manifest: ${sha256}`);

const repository = join(mkdtempSync("/tmp/hx-opencv-release-haxelib-"), "repository");
const environment = { ...process.env, HAXELIB_PATH: repository };
mkdirSync(repository);
execFileSync("haxelib", ["dev", "hx-opencv", root], { cwd: root, env: environment, stdio: "inherit" });
execFileSync("haxe", ["fixtures/release/build.hxml"], { cwd: root, env: environment, stdio: "inherit" });

const generated = readFileSync(output, "utf8");
const bundleOccurrences = generated.split("(function (root, factory) {").length - 1;
if (bundleOccurrences !== 1) throw new Error(`expected exactly one bundled OpenCV payload, found ${bundleOccurrences}`);
const haxeOutput = generated.slice(generated.lastIndexOf(";(function ($global)"));
const emitted = ["cv.Mat", "cv.absdiff", "cv.addWeighted", "cv.cornerHarris", "cv.ORB", "cv.BackgroundSubtractorMOG2", "cv.QRCodeDetector", "cv.CLAHE", "cv.blobFromImage", "cv.Rodrigues"];
for (const access of emitted) if (!haxeOutput.includes(access)) throw new Error(`generated Haxe output is missing ${access}`);

const require = createRequire(import.meta.url);
const commonJs = require(output);
for (let attempt = 0; attempt < 50 && globalThis.__hxOpenCvReleaseReady !== true; attempt++) await new Promise((resolve) => setTimeout(resolve, 100));
if (globalThis.__hxOpenCvReleaseReady !== true || typeof globalThis.cv?.Mat !== "function") throw new Error("isolated consumer did not reach OpenCV readiness");
if (typeof commonJs !== "object") throw new Error("OpenCV inclusion corrupted the generated CommonJS export");
const version = (globalThis.cv.getBuildInformation().match(/General configuration for OpenCV ([^\s]+)/) || [])[1];
if (version !== manifest.bundle.version) throw new Error(`runtime version differs from manifest: ${version}`);

console.log(JSON.stringify({ consumer: "isolated -lib hx-opencv", bundleOccurrences, emittedCvAccess: emitted.length, sha256, version }));
