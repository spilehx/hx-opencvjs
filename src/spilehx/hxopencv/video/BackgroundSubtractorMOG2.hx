package spilehx.hxopencv.video;

import spilehx.hxopencv.core.CvDisposable;
import spilehx.hxopencv.core.Mat;

@:native("cv.BackgroundSubtractorMOG2")
extern class BackgroundSubtractorMOG2 implements CvDisposable {
	function new(?history:Int, ?varThreshold:Float, ?detectShadows:Bool):Void;
	function apply(image:Mat, fgmask:Mat, ?learningRate:Float):Void;
	function getBackgroundImage(backgroundImage:Mat):Void;
	@:native("delete") function delete():Void;
}
