package spilehx.hxopencv.features;

import spilehx.hxopencv.core.CvDisposable;
import spilehx.hxopencv.core.Mat;

@:native("cv.GFTTDetector")
extern class GFTTDetector implements CvDisposable {
	function new(?maxCorners:Int, ?qualityLevel:Float, ?minDistance:Float, ?blockSize:Int, ?gradiantSize:Int, ?useHarrisDetector:Bool, ?k:Float):Void;
	function detect(image:Mat, keypoints:KeyPointVector, ?mask:Mat):Void;
	function getBlockSize():Int;
	function getHarrisDetector():Bool;
	function getK():Float;
	function getMaxFeatures():Int;
	function getMinDistance():Float;
	function getQualityLevel():Float;
	function setBlockSize(value:Int):Void;
	function setHarrisDetector(value:Bool):Void;
	function setK(value:Float):Void;
	function setMaxFeatures(value:Int):Void;
	function setMinDistance(value:Float):Void;
	function setQualityLevel(value:Float):Void;
	@:native("delete") function delete():Void;
}
