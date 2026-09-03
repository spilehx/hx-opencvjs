package spilehx.hxopencv.video;

import spilehx.hxopencv.core.CvDisposable;
import spilehx.hxopencv.core.Mat;
import spilehx.hxopencv.core.Rect;

@:native("cv.TrackerMIL_Params")
extern class TrackerMILParams {
	var featureSetNumFeatures:Int;
	var samplerInitInRadius:Float;
	var samplerInitMaxNegNum:Int;
	var samplerSearchWinSize:Float;
	var samplerTrackInRadius:Float;
	var samplerTrackMaxNegNum:Int;
	var samplerTrackMaxPosNum:Int;
}

@:native("cv.TrackerMIL")
extern class TrackerMIL implements CvDisposable {
	function new(?parameters:TrackerMILParams):Void;
	function init(image:Mat, boundingBox:Rect):Void;
	function update(image:Mat):Rect;
	@:native("delete") function delete():Void;
}
