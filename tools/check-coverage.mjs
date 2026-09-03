import { mkdirSync, readFileSync, readdirSync, writeFileSync } from "node:fs";
import { join, relative } from "node:path";

const root = new URL("..", import.meta.url).pathname;
const manifest = JSON.parse(readFileSync(join(root, "manifest/opencv-5.0.0.json"), "utf8"));
const sourceRoot = join(root, "src/spilehx/hxopencv");
const sourceFiles = [];
function walk(path) {
  for (const entry of readdirSync(path, { withFileTypes: true })) {
    const fullPath = join(path, entry.name);
    if (entry.isDirectory()) walk(fullPath);
    else if (entry.name.endsWith(".hx")) sourceFiles.push(fullPath);
  }
}
walk(sourceRoot);

const represented = new Set();
const evidence = new Map();
const add = (name, file) => {
  represented.add(name);
  const entries = evidence.get(name) || [];
  entries.push(relative(root, file));
  evidence.set(name, entries);
};
const constantPrefixes = ["", "CV_", "COLOR_", "INTER_", "THRESH_", "ADAPTIVE_THRESH_", "MORPH_", "RETR_", "CHAIN_", "BORDER_", "FONT_", "MARKER_", "HISTCMP_", "HOUGH_", "WARP_", "CALIB_", "SOLVEPNP_", "FM_", "USAC_", "STEREO_", "StereoBM_", "StereoMatcher_", "StereoSGBM_", "ORB_", "FastFeatureDetector_", "DescriptorMatcher_", "DNN_", "DNN_BACKEND_", "DNN_TARGET_", "DNN_LAYOUT_", "DNN_MODEL_", "INPAINT_", "DICT_", "CORNER_REFINE_"];
for (const file of sourceFiles) {
  const source = readFileSync(file, "utf8");
  for (const match of source.matchAll(/@:native\("cv\.([A-Za-z0-9_]+)"\)/g)) add(match[1], file);
  for (const match of source.matchAll(/@:native\("([A-Za-z0-9_]+)"\)/g)) add(match[1], file);
  for (const match of source.matchAll(/\bstatic\s+function\s+([A-Za-z0-9_]+)\s*\(/g)) add(match[1], file);
  for (const match of source.matchAll(/\bpublic\s+static\s+inline\s+var\s+([A-Za-z0-9_]+)/g)) {
    for (const prefix of constantPrefixes) add(`${prefix}${match[1]}`, file);
  }
}

const runtimePattern = /^(HEAP|FS|UTF|dynCall|ccall|cwrap|addFunction|removeFunction|stack|allocate|writeArrayToMemory|getValue|setValue|getMemory|lengthBytesUTF|intArray|Pointer_|Emval|BindingError|ExitStatus|InternalError$|UnboundTypeError$|inspect$|then$|asm$|calledRun$|run$|preRun$|postRun$|onRuntimeInitialized$|count_emval_handles$|exceptionFromPtr$|flushPendingDeletes$|getInheritedInstanceCount$|getLiveInheritedInstances$|get_first_emval$|pauseMainLoop$|resumeMainLoop$|requestAnimationFrame$|setCanvasSize$|setDelayFunction$|addRunDependency$|removeRunDependency$|createContext$|getUserMedia$|preloadedAudios$|preloadedImages$|requestFullScreen$|requestFullscreen$|stderr$|stdin$|stdout$|Module$|wasmMemory$|wasmTable$|_)/;
const browserHelpers = new Set(["imread", "imshow", "matFromArray", "matFromImageData", "VideoCapture"]);
const supportingPattern = /(Vector|^Mat$|^Point$|^Size$|^Rect$|^RotatedRect$|^Scalar$|^Range$|^TermCriteria$|^MinMaxLoc$|^Circle$|^DMatch$|^KeyPoint$|^UsacParams$)/;
const ambiguousExports = new Set([
  "CamShift", "HuMoments", "Point2fVector", "Point3fVector", "approxPolyN", "clipLine", "convertMaps",
  "divide", "divide1", "drawKeypoints", "drawMatches", "drawMatches1", "drawMatchesKnn", "ellipse2Poly",
  "findContoursLinkRuns", "findContoursLinkRuns1", "findTransformECC", "findTransformECC1", "fitEllipseAMS",
  "fitEllipseDirect", "floodFill", "getDefaultNewCameraMatrix", "getFontScaleFromHeight", "getRectSubPix",
  "grabCut", "integral", "integral2", "intersectConvexConvex", "invertAffineTransform", "kmeans", "meanShift",
  "minEnclosingTriangle", "mixChannels", "moments", "norm", "norm1", "perspectiveTransform", "putText1",
  "rotatedRectBoundingRect", "rotatedRectBoundingRect2f", "rotatedRectPoints", "rotatedRectangleIntersection", "solvePoly"
]);
const exports = manifest.exports;
const overloadBases = new Set(Object.keys(manifest.overloadGroups || {}));
const categories = {
  coveredOpenCvApi: [], coveredSupportingType: [], browserRuntimeHelper: [], aliasOrOverload: [],
  intentionallyIgnoredRuntime: [], intentionallyFlattenedEnumContainer: [],
  unmappedOpenCvConstant: [], openCvFacingUnmapped: [], genuinelyAmbiguous: []
};
for (const entry of exports) {
  if (runtimePattern.test(entry.name)) { categories.intentionallyIgnoredRuntime.push(entry.name); continue; }
  if (browserHelpers.has(entry.name)) { (represented.has(entry.name) ? categories.browserRuntimeHelper : categories.openCvFacingUnmapped).push(entry.name); continue; }
  if (entry.kind === "number") {
    (represented.has(entry.name) ? categories.coveredOpenCvApi : categories.unmappedOpenCvConstant).push(entry.name);
    continue;
  }
  if (entry.kind === "function" && entry.staticMembers?.includes("values") && !entry.instanceMembers?.length) {
    categories.intentionallyFlattenedEnumContainer.push(entry.name);
    continue;
  }
  if (represented.has(entry.name)) {
    if (supportingPattern.test(entry.name)) categories.coveredSupportingType.push(entry.name);
    else if (/\d+$/.test(entry.name) && overloadBases.has(entry.name.replace(/\d+$/, ""))) categories.aliasOrOverload.push(entry.name);
    else categories.coveredOpenCvApi.push(entry.name);
  } else if (ambiguousExports.has(entry.name)) categories.genuinelyAmbiguous.push(entry.name);
  else categories.openCvFacingUnmapped.push(entry.name);
}
for (const values of Object.values(categories)) values.sort();
const report = {
  schemaVersion: 1,
  bundle: { sha256: manifest.bundle.sha256, version: manifest.bundle.version, exportCount: exports.length },
  generatedFrom: { manifest: "manifest/opencv-5.0.0.json", haxeFiles: sourceFiles.length },
  counts: Object.fromEntries(Object.entries(categories).map(([name, values]) => [name, values.length])),
  categories,
  represented: Object.fromEntries([...evidence.entries()].sort())
};
mkdirSync(join(root, "coverage"), { recursive: true });
writeFileSync(join(root, "coverage/opencv-5.0.0-coverage.json"), `${JSON.stringify(report, null, 2)}\n`);
console.log(JSON.stringify(report.counts));
