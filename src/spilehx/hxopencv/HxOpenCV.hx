package spilehx.hxopencv;

import js.lib.Promise;

@:build(spilehx.hxopencv.internal.OpenCvIncludeMacro.include())
class HxOpenCV {
	private static var readiness:Promise<Void>;

	/**
		Resolves when the bundled OpenCV.js runtime is ready.

		Await this before using OpenCV externs. The returned promise is cached.
	**/
	public static function init():Promise<Void> {
		if (readiness == null) {
			var cv:Dynamic = js.Syntax.code("globalThis.__hxOpenCvBundle");
			if (cv == null) {
				readiness = Promise.reject("Bundled OpenCV.js was not initialized");
			} else {
				readiness = cast new Promise<Dynamic>(function(resolve, reject) {
					try {
						cv.then(function(_) resolve(null));
					} catch (error) {
						reject(error);
					}
				});
			}
		}

		return readiness;
	}
}
