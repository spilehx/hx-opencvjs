package spilehx.hxopencv.core;

@:native("cv.RotatedRect")
extern class RotatedRect {
	function new(center:Point, size:Size, angle:Float):Void;

	var center:Point;
	var size:Size;
	var angle:Float;
}
