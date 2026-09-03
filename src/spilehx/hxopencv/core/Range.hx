package spilehx.hxopencv.core;

@:native("cv.Range")
extern class Range {
	function new(start:Int, end:Int):Void;

	var start:Int;
	var end:Int;
}
