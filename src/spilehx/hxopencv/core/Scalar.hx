package spilehx.hxopencv.core;

@:native("cv.Scalar")
extern class Scalar extends Array<Float> {
	function new(?v0:Float, ?v1:Float, ?v2:Float, ?v3:Float):Void;

	static function all(value:Float):Scalar;
}
