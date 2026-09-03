package spilehx.hxopencv.dnn;

import haxe.extern.EitherType;
import js.lib.ArrayBufferView;
import spilehx.hxopencv.core.Mat;
import spilehx.hxopencv.core.Scalar;
import spilehx.hxopencv.core.Size;

typedef DnnBuffer = EitherType<ArrayBufferView, Array<Int>>;

@:native("cv")
extern class Dnn {
	static function blobFromImage(image:Mat, ?scalefactor:Float, ?size:Size, ?mean:Scalar, ?swapRB:Bool, ?crop:Bool, ?ddepth:Int):Mat;
	@:overload(function(model:String, config:String):DnnNet {})
	@:overload(function(model:String, config:String, framework:String):DnnNet {})
	@:overload(function(model:String, config:String, framework:String, format:Int):DnnNet {})
	static function readNet(model:String):DnnNet;
	@:native("readNet1")
	@:overload(function(framework:String, bufferModel:DnnBuffer, bufferConfig:DnnBuffer):DnnNet {})
	@:overload(function(framework:String, bufferModel:DnnBuffer, bufferConfig:DnnBuffer, format:Int):DnnNet {})
	static function readNetFromBuffers(framework:String, bufferModel:DnnBuffer):DnnNet;
	@:overload(function(model:String, format:Int):DnnNet {})
	static function readNetFromONNX(model:String):DnnNet;
	@:native("readNetFromONNX1")
	@:overload(function(buffer:DnnBuffer, format:Int):DnnNet {})
	static function readNetFromONNXBuffer(buffer:DnnBuffer):DnnNet;
	@:overload(function(model:String, config:String):DnnNet {})
	static function readNetFromTFLite(model:String):DnnNet;
	@:native("readNetFromTFLite1")
	@:overload(function(modelBuffer:DnnBuffer, configBuffer:DnnBuffer):DnnNet {})
	static function readNetFromTFLiteBuffer(modelBuffer:DnnBuffer):DnnNet;
	@:overload(function(model:String, config:String):DnnNet {})
	@:overload(function(model:String, config:String, framework:String):DnnNet {})
	@:overload(function(model:String, config:String, framework:String, format:Int):DnnNet {})
	static function readNetFromTensorflow(model:String):DnnNet;
	@:native("readNetFromTensorflow1")
	@:overload(function(modelBuffer:DnnBuffer, configBuffer:DnnBuffer):DnnNet {})
	@:overload(function(modelBuffer:DnnBuffer, configBuffer:DnnBuffer, frameworkBuffer:DnnBuffer):DnnNet {})
	@:overload(function(modelBuffer:DnnBuffer, configBuffer:DnnBuffer, frameworkBuffer:DnnBuffer, format:Int):DnnNet {})
	static function readNetFromTensorflowBuffer(modelBuffer:DnnBuffer):DnnNet;
}
