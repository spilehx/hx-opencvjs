package spilehx.hxopencv.video;

import spilehx.hxopencv.core.CvDisposable;
import spilehx.hxopencv.core.Mat;

@:native("cv.BackgroundSubtractor")
extern class BackgroundSubtractor implements CvDisposable {
	function apply(image:Mat, fgmask:Mat, ?learningRate:Float):Void;
	@:native("apply1") function applyWithLearningRate(image:Mat, fgmask:Mat, learningRate:Float):Void;
	function getBackgroundImage(backgroundImage:Mat):Void;
	@:native("delete") function delete():Void;
}
