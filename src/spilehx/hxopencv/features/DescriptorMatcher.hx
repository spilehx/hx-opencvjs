package spilehx.hxopencv.features;

import spilehx.hxopencv.core.CvDisposable;
import spilehx.hxopencv.core.Mat;
import spilehx.hxopencv.core.MatVector;

@:native("cv.DescriptorMatcher")
extern class DescriptorMatcher implements CvDisposable {
	function new(matcherType:String):Void;
	function add(descriptors:MatVector):Void;
	function clear():Void;
	function empty():Bool;
	function isMaskSupported():Bool;
	function train():Void;
	function match(queryDescriptors:Mat, trainDescriptors:Mat, matches:DMatchVector, ?mask:Mat):Void;
	@:native("match1") function matchTrained(queryDescriptors:Mat, matches:DMatchVector, ?masks:MatVector):Void;
	function knnMatch(queryDescriptors:Mat, matches:DMatchVectorVector, k:Int, ?masks:MatVector, ?compactResult:Bool):Void;
	@:native("knnMatch1") function knnMatchWithTrain(queryDescriptors:Mat, trainDescriptors:Mat, matches:DMatchVectorVector, k:Int, ?mask:Mat, ?compactResult:Bool):Void;
	function radiusMatch(queryDescriptors:Mat, matches:DMatchVectorVector, maxDistance:Float, ?masks:MatVector, ?compactResult:Bool):Void;
	@:native("radiusMatch1") function radiusMatchWithTrain(queryDescriptors:Mat, trainDescriptors:Mat, matches:DMatchVectorVector, maxDistance:Float, ?mask:Mat, ?compactResult:Bool):Void;
	@:native("delete") function delete():Void;
}
