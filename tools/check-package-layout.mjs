import { existsSync, readdirSync, statSync } from "node:fs";
import { join, relative } from "node:path";

const root = new URL("..", import.meta.url).pathname;
const required = [
  ".gitignore", "README.md", "haxelib.json", "lib/opencv.js", "manifest/opencv-5.0.0.json",
  "coverage/opencv-5.0.0-coverage.json", "fixtures/release/Consumer.hx", "fixtures/release/build.hxml",
  "fixtures/release/browser.html", "tools/generate-runtime-manifest.js", "tools/check-coverage.mjs",
  "tools/check-package-layout.mjs", "tools/verify-release.mjs", "tools/verify-release-browser.mjs",
  "src/spilehx/hxopencv/HxOpenCV.hx"
];
const obsolete = ["API_PLAN.md", "extraParams.hxml", "src/spilehx/hxopencv/api/OpenCVApi.hx"];
for (const item of required) if (!existsSync(join(root, item))) throw new Error(`required package file is missing: ${item}`);
for (const item of obsolete) if (existsSync(join(root, item))) throw new Error(`obsolete package file remains: ${item}`);
for (const directory of ["fixtures", "tools"]) {
  for (const name of readdirSync(join(root, directory))) {
    if (/^phase[1-6]$/.test(name) || /^probe-phase|^verify-phase/.test(name)) throw new Error(`obsolete phase artifact remains: ${join(directory, name)}`);
  }
}
const packageFiles = [];
function walk(path) {
  for (const entry of readdirSync(path)) {
    if (entry === ".git" || entry === ".agents" || entry === ".codex") continue;
    const full = join(path, entry);
    if (statSync(full).isDirectory()) walk(full);
    else packageFiles.push(relative(root, full));
  }
}
walk(root);
console.log(JSON.stringify({ packageLayout: "intentional", fileCount: packageFiles.length, topLevel: readdirSync(root).filter((name) => ![".agents", ".codex", ".git"].includes(name)).sort() }));
