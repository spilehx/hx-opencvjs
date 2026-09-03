package spilehx.hxopencv.calib;

import spilehx.hxopencv.core.CvDisposable;

@:native("cv.UsacParams")
extern class UsacParams implements CvDisposable {
	function new():Void;
	var confidence:Float;
	var final_polisher:Int;
	var final_polisher_iterations:Int;
	var isParallel:Bool;
	var loIterations:Int;
	var loMethod:Int;
	var loSampleSize:Int;
	var maxIterations:Int;
	var neighborsSearch:Int;
	var randomGeneratorState:Int;
	var sampler:Int;
	var score:Int;
	var threshold:Float;
	@:native("delete") function delete():Void;
}
