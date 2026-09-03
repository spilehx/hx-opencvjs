package spilehx.hxopencv.photo;

import spilehx.hxopencv.core.CvDisposable;
import spilehx.hxopencv.core.Mat;

@:native("cv.Tonemap")
extern class Tonemap implements CvDisposable {
	function getGamma():Float;
	function process(src:Mat, dst:Mat):Void;
	function setGamma(value:Float):Void;
	@:native("delete") function delete():Void;
}

@:native("cv.TonemapDrago")
extern class TonemapDrago implements CvDisposable {
	function new(?gamma:Float, ?saturation:Float, ?bias:Float):Void;
	function process(src:Mat, dst:Mat):Void;
	function getGamma():Float;
	function getBias():Float;
	function getSaturation():Float;
	function setBias(value:Float):Void;
	function setSaturation(value:Float):Void;
	function setGamma(value:Float):Void;
	@:native("delete") function delete():Void;
}

@:native("cv.TonemapMantiuk")
extern class TonemapMantiuk implements CvDisposable {
	function new(?gamma:Float, ?scale:Float, ?saturation:Float):Void;
	function process(src:Mat, dst:Mat):Void;
	function getGamma():Float;
	function getScale():Float;
	function getSaturation():Float;
	function setScale(value:Float):Void;
	function setSaturation(value:Float):Void;
	function setGamma(value:Float):Void;
	@:native("delete") function delete():Void;
}

@:native("cv.TonemapReinhard")
extern class TonemapReinhard implements CvDisposable {
	function new(?gamma:Float, ?intensity:Float, ?lightAdaptation:Float, ?colorAdaptation:Float):Void;
	function process(src:Mat, dst:Mat):Void;
	function getGamma():Float;
	function getColorAdaptation():Float;
	function getIntensity():Float;
	function getLightAdaptation():Float;
	function setColorAdaptation(value:Float):Void;
	function setIntensity(value:Float):Void;
	function setLightAdaptation(value:Float):Void;
	function setGamma(value:Float):Void;
	@:native("delete") function delete():Void;
}
