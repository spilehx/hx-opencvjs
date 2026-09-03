package spilehx.hxopencv.features;

import spilehx.hxopencv.core.CvDisposable;
import spilehx.hxopencv.core.Mat;
import spilehx.hxopencv.core.MatVector;

@:native("cv.Feature2D")
extern class Feature2D implements CvDisposable {
	function compute(image:Mat, keypoints:KeyPointVector, descriptors:Mat):Void;
	@:native("compute1") function computeMany(images:MatVector, keypoints:KeyPointVectorVector, descriptors:MatVector):Void;
	function detect(image:Mat, keypoints:KeyPointVector, ?mask:Mat):Void;
	@:native("detect1") function detectMany(images:MatVector, keypoints:KeyPointVectorVector, ?masks:MatVector):Void;
	function detectAndCompute(image:Mat, mask:Mat, keypoints:KeyPointVector, descriptors:Mat, ?useProvidedKeypoints:Bool):Void;
	function defaultNorm():Int;
	function descriptorSize():Int;
	function descriptorType():Int;
	function empty():Bool;
	function getDefaultName():String;
	@:native("delete") function delete():Void;
}
