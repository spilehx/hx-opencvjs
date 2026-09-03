package spilehx.hxopencv.features;

import spilehx.hxopencv.core.Mat;
import spilehx.hxopencv.core.CvDisposable;
import spilehx.hxopencv.core.PointVectorVector;
import spilehx.hxopencv.core.RectVector;

@:native("cv.MSER")
extern class MSER implements CvDisposable {
	function new(?delta:Int, ?minArea:Int, ?maxArea:Int, ?maxVariation:Float, ?minDiversity:Float, ?maxEvolution:Int, ?areaThreshold:Float, ?minMargin:Float, ?edgeBlurSize:Int):Void;
	function detectRegions(image:Mat, msers:PointVectorVector, bboxes:RectVector):Void;
	function getDelta():Int;
	function getMaxArea():Int;
	function getMinArea():Int;
	function getPass2Only():Bool;
	function setDelta(value:Int):Void;
	function setMaxArea(value:Int):Void;
	function setMinArea(value:Int):Void;
	function setPass2Only(value:Bool):Void;
	@:native("delete") function delete():Void;
}
