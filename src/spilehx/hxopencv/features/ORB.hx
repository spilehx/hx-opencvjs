package spilehx.hxopencv.features;

import spilehx.hxopencv.core.CvDisposable;
import spilehx.hxopencv.core.Mat;

@:native("cv.ORB")
extern class ORB implements CvDisposable {
	function new(?nfeatures:Int, ?scaleFactor:Float, ?nlevels:Int, ?edgeThreshold:Int, ?firstLevel:Int, ?WTA_K:Int, ?scoreType:Int, ?patchSize:Int, ?fastThreshold:Int):Void;
	function detect(image:Mat, keypoints:KeyPointVector, ?mask:Mat):Void;
	function compute(image:Mat, keypoints:KeyPointVector, descriptors:Mat):Void;
	function detectAndCompute(image:Mat, mask:Mat, keypoints:KeyPointVector, descriptors:Mat, ?useProvidedKeypoints:Bool):Void;
	function getFastThreshold():Int;
	function setEdgeThreshold(value:Int):Void;
	function setFastThreshold(value:Int):Void;
	function setFirstLevel(value:Int):Void;
	function setMaxFeatures(value:Int):Void;
	function setNLevels(value:Int):Void;
	function setPatchSize(value:Int):Void;
	function setScaleFactor(value:Float):Void;
	function setScoreType(value:Int):Void;
	function setWTA_K(value:Int):Void;
	@:native("delete") function delete():Void;
}
