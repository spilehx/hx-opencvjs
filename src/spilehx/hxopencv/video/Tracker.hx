package spilehx.hxopencv.video;

import spilehx.hxopencv.core.CvDisposable;
import spilehx.hxopencv.core.Mat;
import spilehx.hxopencv.core.Rect;

@:native("cv.Tracker")
extern class Tracker implements CvDisposable {
	function init(image:Mat, boundingBox:Rect):Void;
	function update(image:Mat):Rect;
	@:native("delete") function delete():Void;
}
