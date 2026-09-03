(function (root, bundleRoot) {
  var cv = bundleRoot.cv || root.cv || (__hxOpenCvOriginalModule && __hxOpenCvOriginalModule.exports);
  if (__hxOpenCvOriginalModule) {
    __hxOpenCvOriginalModule.exports = __hxOpenCvOriginalModuleExports;
  }
  define = __hxOpenCvOriginalDefine;
  if (!cv) {
    throw new Error("Bundled OpenCV.js did not publish cv");
  }
  root.cv = cv;
  root.__hxOpenCvBundle = cv;
}(typeof globalThis === "object" ? globalThis : this, __hxOpenCvBundleRoot));
