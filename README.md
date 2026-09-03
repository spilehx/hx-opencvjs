# hx-opencv

`hx-opencv` is a self-contained Haxelib of typed Haxe externs for the JavaScript target. It bundles OpenCV.js **5.0.0** (SHA-256 `bf6130c3d755915e5d005b69e574225817f98dc5556fe640628f8f18c1eb568f`), including its single-file WebAssembly payload.

## Use

The library is JavaScript-target only. Add `-lib hx-opencv`, await readiness once, then use the `spilehx.hxopencv.*` externs:

```haxe
import js.lib.Uint8Array;
import spilehx.hxopencv.HxOpenCV;
import spilehx.hxopencv.browser.ImgIo;
import spilehx.hxopencv.core.Mat;
import spilehx.hxopencv.core.MatType;
import spilehx.hxopencv.imgproc.Imgproc;

class Main {
  static function main() {
    HxOpenCV.init().then(function(_) {
      var source = ImgIo.matFromArray(2, 2, MatType.CV_8UC1, new Uint8Array([0, 1, 2, 3]));
      var result = new Mat();
      Imgproc.threshold(source, result, 1, 255, 0);
      // Consume result here.
      source.delete();
      result.delete();
    });
  }
}
```

`HxOpenCV.init()` is a cached readiness barrier for the bundled runtime. Calling externs before it resolves is unsupported. Embind-backed values such as `Mat`, vectors, algorithm instances, and returned owned objects require explicit `delete()` when no longer needed; Haxe garbage collection does not release their OpenCV allocations.

Representative supported areas include core/Mat operations, imgproc, browser image helpers, features, video, detection, DNN, photo, and calibration. The maintained [coverage report](coverage/opencv-5.0.0-coverage.json) records the exact bundle inventory: **452 covered exports**, **7 explicitly unmapped exports**, and **43 signature/ownership-ambiguous exports**. The latter two categories are intentionally not exposed without runtime evidence; browser-disabled native I/O remains unavailable.

## Maintenance checks

```sh
node tools/check-coverage.mjs
node tools/check-package-layout.mjs
node tools/verify-release.mjs
node tools/verify-release-browser.mjs
```

`tools/generate-runtime-manifest.js` regenerates the checked-in runtime manifest only when `lib/opencv.js` changes.
