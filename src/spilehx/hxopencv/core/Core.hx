package spilehx.hxopencv.core;

@:native("cv")
extern class Core {
	static function add(src1:Mat, src2:Mat, dst:Mat):Void;
	static function mean(src:Mat):Scalar;
}
