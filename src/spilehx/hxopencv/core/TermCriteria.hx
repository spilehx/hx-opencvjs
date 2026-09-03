package spilehx.hxopencv.core;

@:native("cv.TermCriteria")
extern class TermCriteria {
	function new(?type:Int, ?maxCount:Int, ?epsilon:Float):Void;
	var type:Int;
	var maxCount:Int;
	var epsilon:Float;
}
