package spilehx.hxopencv.internal;

#if macro
import haxe.io.Path;
import haxe.macro.Compiler;
import haxe.macro.Context;
import haxe.macro.Expr;
#end

class OpenCvIncludeMacro {
	#if macro
	private static var included = false;

	public static function include():Array<Field> {
		if (!Context.defined("js")) {
			Context.error("hx-opencv supports the Haxe JavaScript target only", Context.currentPos());
		}

		if (!included) {
			included = true;
			var source = Context.resolvePath("spilehx/hxopencv/internal/OpenCvIncludeMacro.hx");
			var root = source;
			for (_ in 0...5) {
				root = Path.directory(root);
			}

			Compiler.includeFile(Path.join([root, "src", "spilehx", "hxopencv", "internal", "opencv-prelude.js"]));
			Compiler.includeFile(Path.join([root, "lib", "opencv.js"]));
			Compiler.includeFile(Path.join([root, "src", "spilehx", "hxopencv", "internal", "opencv-postlude.js"]));
		}

		return Context.getBuildFields();
	}
	#end
}
