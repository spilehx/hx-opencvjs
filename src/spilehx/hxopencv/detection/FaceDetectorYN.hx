package spilehx.hxopencv.detection;

import spilehx.hxopencv.core.CvDisposable;
import spilehx.hxopencv.core.Mat;
import spilehx.hxopencv.core.Size;

@:native("cv.FaceDetectorYN")
extern class FaceDetectorYN implements CvDisposable {
	function new(model:String, config:String, inputSize:Size, ?scoreThreshold:Float, ?nmsThreshold:Float, ?topK:Int, ?backendId:Int, ?targetId:Int):Void;
	function detect(inputImage:Mat, faces:Mat):Void;
	function getInputSize():Size;
	function getNMSThreshold():Float;
	function getScoreThreshold():Float;
	function getTopK():Int;
	function setInputSize(inputSize:Size):Void;
	function setNMSThreshold(value:Float):Void;
	function setScoreThreshold(value:Float):Void;
	function setTopK(value:Int):Void;
	@:native("delete") function delete():Void;
}
