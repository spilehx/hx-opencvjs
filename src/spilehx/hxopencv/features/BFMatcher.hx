package spilehx.hxopencv.features;

import spilehx.hxopencv.core.CvDisposable;
import spilehx.hxopencv.core.Mat;
import spilehx.hxopencv.core.MatVector;

@:native("cv.BFMatcher")
extern class BFMatcher implements CvDisposable {
	function new(?normType:Int, ?crossCheck:Bool):Void;
	function match(queryDescriptors:Mat, trainDescriptors:Mat, matches:DMatchVector, ?mask:Mat):Void;
	@:native("match1") function matchTrained(queryDescriptors:Mat, matches:DMatchVector, ?masks:MatVector):Void;
	@:native("delete") function delete():Void;
}
