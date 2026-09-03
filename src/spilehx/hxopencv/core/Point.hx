package spilehx.hxopencv.core;

@:native("cv.Point")
extern class Point {
	function new(?x:Float, ?y:Float):Void;

	var x:Float;
	var y:Float;
}
