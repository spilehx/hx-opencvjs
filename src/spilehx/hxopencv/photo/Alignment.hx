package spilehx.hxopencv.photo;

import spilehx.hxopencv.core.CvDisposable;
import spilehx.hxopencv.core.Mat;
import spilehx.hxopencv.core.MatVector;

@:native("cv.AlignExposures")
extern class AlignExposures implements CvDisposable {
	function process(src:MatVector, dst:MatVector, times:Mat, response:Mat):Void;
	@:native("delete") function delete():Void;
}

@:native("cv.AlignMTB")
extern class AlignMTB implements CvDisposable {
	function new(?maxBits:Int, ?excludeRange:Int, ?cut:Bool):Void;
	function calculateShift(img0:Mat, img1:Mat):Int;
	function computeBitmaps(img:Mat, tb:Mat, eb:Mat):Void;
	function shiftMat(src:Mat, dst:Mat, shift:Int):Void;
	function getCut():Bool;
	function getExcludeRange():Int;
	function getMaxBits():Int;
	function setCut(value:Bool):Void;
	function setExcludeRange(value:Int):Void;
	function setMaxBits(value:Int):Void;
	@:native("delete") function delete():Void;
}
