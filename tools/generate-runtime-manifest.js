#!/usr/bin/env node

const crypto = require("crypto");
const fs = require("fs");
const path = require("path");

const root = path.resolve(__dirname, "..");
const bundlePath = path.join(root, "lib", "opencv.js");
const outputPath = path.join(root, "manifest", "opencv-5.0.0.json");
const bundle = fs.readFileSync(bundlePath);
const cv = require(bundlePath);

function property(value) {
  const kind = typeof value;
  const result = { kind };
  if (kind === "function") {
    result.arity = value.length;
    result.staticMembers = Object.getOwnPropertyNames(value)
      .filter((name) => !["arguments", "caller", "length", "name", "prototype"].includes(name))
      .sort();
    result.instanceMembers = value.prototype
      ? Object.getOwnPropertyNames(value.prototype).filter((name) => name !== "constructor").sort()
      : [];
  } else if (kind === "number" || kind === "string" || kind === "boolean") {
    result.value = value;
  }
  return result;
}

function errorMessage(action) {
  try {
    action();
    return null;
  } catch (error) {
    return String(error && error.message ? error.message : error);
  }
}

async function ready() {
  if (cv && typeof cv.then === "function") {
    await new Promise((resolve, reject) => {
      try {
        cv.then(() => resolve());
      } catch (error) {
        reject(error);
      }
    });
  }
}

async function main() {
  await ready();
  const exports = Object.keys(cv).sort().map((name) => ({ name, ...property(cv[name]) }));
  const names = new Set(exports.map((entry) => entry.name));
  const overloadGroups = {};
  for (const name of names) {
    const match = /^(.*?)([1-9]\d*)$/.exec(name);
    if (match && names.has(match[1])) {
      (overloadGroups[match[1]] ||= []).push(name);
    }
  }
  for (const variants of Object.values(overloadGroups)) variants.sort();

  const buildInformation = cv.getBuildInformation();
  const mat = new cv.Mat();
  const manifest = {
    schemaVersion: 1,
    bundle: {
      path: "lib/opencv.js",
      sha256: crypto.createHash("sha256").update(bundle).digest("hex"),
      bytes: bundle.length,
      version: (buildInformation.match(/General configuration for OpenCV ([^\s]+)/) || [])[1] || null,
      buildInformation,
      runtime: { host: "node", version: process.version }
    },
    exports,
    overloadGroups,
    probes: {
      exportCount: exports.length,
      matDataView: mat.data.constructor.name,
      rectInvalidArity: errorMessage(() => new cv.Rect(1, 2, 3))
    }
  };
  mat.delete();
  fs.mkdirSync(path.dirname(outputPath), { recursive: true });
  fs.writeFileSync(outputPath, `${JSON.stringify(manifest, null, 2)}\n`);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
