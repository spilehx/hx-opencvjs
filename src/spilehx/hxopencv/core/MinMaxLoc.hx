package spilehx.hxopencv.core;

@:native("cv.MinMaxLoc")
extern class MinMaxLoc {
	function new(?minVal:Float, ?maxVal:Float, ?minLoc:Point, ?maxLoc:Point):Void;

	var minVal:Float;
	var maxVal:Float;
	var minLoc:Point;
	var maxLoc:Point;
}
