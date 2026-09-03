package spilehx.hxopencv.features;

import spilehx.hxopencv.core.CvDisposable;
import spilehx.hxopencv.core.Mat;

@:native("cv.SimpleBlobDetector_Params")
extern class SimpleBlobDetectorParams {
	var blobColor:Int;
	var collectContours:Bool;
	var filterByArea:Bool;
	var filterByCircularity:Bool;
	var filterByColor:Bool;
	var filterByConvexity:Bool;
	var filterByInertia:Bool;
	var maxArea:Float;
	var minArea:Float;
	var minThreshold:Float;
	var maxThreshold:Float;
	var thresholdStep:Float;
}

@:native("cv.SimpleBlobDetector")
extern class SimpleBlobDetector implements CvDisposable {
	function new(?params:SimpleBlobDetectorParams):Void;
	function detect(image:Mat, keypoints:KeyPointVector, ?mask:Mat):Void;
	function getParams():SimpleBlobDetectorParams;
	function setParams(params:SimpleBlobDetectorParams):Void;
	@:native("delete") function delete():Void;
}
