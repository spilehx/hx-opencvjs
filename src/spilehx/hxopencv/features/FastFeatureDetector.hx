package spilehx.hxopencv.features;

import spilehx.hxopencv.core.CvDisposable;
import spilehx.hxopencv.core.Mat;

@:native("cv.FastFeatureDetector")
extern class FastFeatureDetector implements CvDisposable {
	function new(?threshold:Int, ?nonmaxSuppression:Bool, ?type:Int):Void;
	function detect(image:Mat, keypoints:KeyPointVector, ?mask:Mat):Void;
	function getNonmaxSuppression():Bool;
	function getThreshold():Int;
	function getType():Int;
	function setNonmaxSuppression(value:Bool):Void;
	function setThreshold(value:Int):Void;
	function setType(value:Int):Void;
	@:native("delete") function delete():Void;
}
