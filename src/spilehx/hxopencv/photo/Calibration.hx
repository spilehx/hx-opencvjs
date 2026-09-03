package spilehx.hxopencv.photo;

import spilehx.hxopencv.core.CvDisposable;
import spilehx.hxopencv.core.Mat;
import spilehx.hxopencv.core.MatVector;

@:native("cv.CalibrateCRF")
extern class CalibrateCRF implements CvDisposable {
	function process(src:MatVector, dst:Mat, times:Mat):Void;
	@:native("delete") function delete():Void;
}

@:native("cv.CalibrateDebevec")
extern class CalibrateDebevec implements CvDisposable {
	function new(?samples:Int, ?lambda:Float, ?random:Bool):Void;
	function process(src:MatVector, dst:Mat, times:Mat):Void;
	function getLambda():Float;
	function getRandom():Bool;
	function getSamples():Int;
	function setLambda(value:Float):Void;
	function setRandom(value:Bool):Void;
	function setSamples(value:Int):Void;
	@:native("delete") function delete():Void;
}

@:native("cv.CalibrateRobertson")
extern class CalibrateRobertson implements CvDisposable {
	function new(?maxIter:Int, ?threshold:Float):Void;
	function process(src:MatVector, dst:Mat, times:Mat):Void;
	function getMaxIter():Int;
	function getRadiance():Mat;
	function getThreshold():Float;
	function setMaxIter(value:Int):Void;
	function setThreshold(value:Float):Void;
	@:native("delete") function delete():Void;
}
