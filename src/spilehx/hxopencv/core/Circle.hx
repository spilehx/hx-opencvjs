package spilehx.hxopencv.core;

@:native("cv.Circle")
extern class Circle {
	function new(?center:Point, ?radius:Float):Void;

	var center:Point;
	var radius:Float;
}
