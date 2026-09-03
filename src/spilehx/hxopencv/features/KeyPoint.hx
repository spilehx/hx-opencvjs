package spilehx.hxopencv.features;

import spilehx.hxopencv.core.Point;

@:native("cv.KeyPoint")
extern class KeyPoint {
	function new(?x:Float, ?y:Float, ?size:Float, ?angle:Float, ?response:Float, ?octave:Int, ?classId:Int):Void;

	var pt:Point;
	var size:Float;
	var angle:Float;
	var response:Float;
	var octave:Int;
	@:native("class_id") var classId:Int;
}
