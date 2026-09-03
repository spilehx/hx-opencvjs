package spilehx.hxopencv.detection;

import spilehx.hxopencv.core.CvDisposable;
import spilehx.hxopencv.core.Mat;
import spilehx.hxopencv.detection.Aruco.ArucoDetectorParameters;

@:native("cv.GraphicalCodeDetector")
extern class GraphicalCodeDetector implements CvDisposable {
	function detect(image:Mat, points:Mat):Bool;
	function detectAndDecode(image:Mat, ?points:Mat, ?straightCode:Mat):String;
	function decode(image:Mat, points:Mat, ?straightCode:Mat):String;
	function detectMulti(image:Mat, points:Mat):Bool;
	function detectAndDecodeMulti(image:Mat, decodedInfo:Array<String>, points:Mat, ?straightCode:Mat):Bool;
	function decodeMulti(image:Mat, points:Mat, decodedInfo:Array<String>, ?straightCode:Mat):Bool;
	@:native("delete") function delete():Void;
}

@:native("cv.QRCodeDetector")
extern class QRCodeDetector implements CvDisposable {
	function new():Void;
	function detect(image:Mat, points:Mat):Bool;
	function detectAndDecode(image:Mat, ?points:Mat, ?straightCode:Mat):String;
	function decode(image:Mat, points:Mat, ?straightCode:Mat):String;
	function detectMulti(image:Mat, points:Mat):Bool;
	function detectAndDecodeMulti(image:Mat, decodedInfo:Array<String>, points:Mat, ?straightCode:Mat):Bool;
	function decodeMulti(image:Mat, points:Mat, decodedInfo:Array<String>, ?straightCode:Mat):Bool;
	function decodeCurved(image:Mat, points:Mat, ?straightCode:Mat):String;
	function detectAndDecodeCurved(image:Mat, ?points:Mat, ?straightCode:Mat):String;
	function setEpsX(epsX:Float):Void;
	function setEpsY(epsY:Float):Void;
	@:native("delete") function delete():Void;
}

@:native("cv.QRCodeDetectorAruco_Params")
extern class QRCodeDetectorArucoParams implements CvDisposable {
	function new():Void;
	var maxColorsMismatch:Float;
	var maxModuleSizeMismatch:Float;
	var maxPenalties:Int;
	var maxRotation:Float;
	var maxTimingPatternMismatch:Float;
	var minModuleSizeInPyramid:Float;
	var scaleTimingPatternScore:Float;
	@:native("delete") function delete():Void;
}

@:native("cv.QRCodeDetectorAruco")
extern class QRCodeDetectorAruco implements CvDisposable {
	function new(?params:QRCodeDetectorArucoParams):Void;
	function detect(image:Mat, points:Mat):Bool;
	function detectAndDecode(image:Mat, ?points:Mat, ?straightCode:Mat):String;
	function decode(image:Mat, points:Mat, ?straightCode:Mat):String;
	function setArucoParameters(params:QRCodeDetectorArucoParams):Void;
	function setDetectorParameters(params:ArucoDetectorParameters):Void;
	@:native("delete") function delete():Void;
}
