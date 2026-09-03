package spilehx.hxopencv.core;

import js.lib.Float32Array;
import js.lib.Float64Array;
import js.lib.Int16Array;
import js.lib.Int32Array;
import js.lib.Int8Array;
import js.lib.Uint16Array;
import js.lib.Uint8Array;

@:native("cv.Mat")
extern class Mat implements CvDisposable {
	@:overload(function(rows:Int, cols:Int, type:Int):Void {})
	@:overload(function(rows:Int, cols:Int, type:Int, scalar:Scalar):Void {})
	function new():Void;

	var rows(default, null):Int;
	var cols(default, null):Int;
	var data(default, null):Uint8Array;
	var data8S(default, null):Int8Array;
	var data16U(default, null):Uint16Array;
	var data16S(default, null):Int16Array;
	var data32S(default, null):Int32Array;
	var data32F(default, null):Float32Array;
	var data64F(default, null):Float64Array;

	@:native("delete")
	function delete():Void;

	function isContinuous():Bool;
}
