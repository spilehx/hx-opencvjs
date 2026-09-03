package spilehx.hxopencv.photo;

import spilehx.hxopencv.core.CvDisposable;
import spilehx.hxopencv.core.Mat;
import spilehx.hxopencv.core.MatVector;

@:native("cv.MergeExposures")
extern class MergeExposures implements CvDisposable {
	function process(src:MatVector, dst:Mat, times:Mat, response:Mat):Void;
	@:native("delete") function delete():Void;
}

@:native("cv.MergeDebevec")
extern class MergeDebevec implements CvDisposable {
	function process(src:MatVector, dst:Mat, times:Mat, response:Mat):Void;
	@:native("process1") function processWithResponse(src:MatVector, dst:Mat, response:Mat):Void;
	@:native("delete") function delete():Void;
}

@:native("cv.MergeMertens")
extern class MergeMertens implements CvDisposable {
	function new(?contrastWeight:Float, ?saturationWeight:Float, ?exposureWeight:Float):Void;
	function process(src:MatVector, dst:Mat):Void;
	@:native("process1") function processWithTimes(src:MatVector, dst:Mat, times:Mat, response:Mat):Void;
	function getContrastWeight():Float;
	function getSaturationWeight():Float;
	function getExposureWeight():Float;
	function setContrastWeight(value:Float):Void;
	function setSaturationWeight(value:Float):Void;
	function setExposureWeight(value:Float):Void;
	@:native("delete") function delete():Void;
}

@:native("cv.MergeRobertson")
extern class MergeRobertson implements CvDisposable {
	function process(src:MatVector, dst:Mat, times:Mat, response:Mat):Void;
	@:native("process1") function processWithResponse(src:MatVector, dst:Mat, response:Mat):Void;
	@:native("delete") function delete():Void;
}
