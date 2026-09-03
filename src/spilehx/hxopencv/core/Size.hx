package spilehx.hxopencv.core;

@:native("cv.Size")
extern class Size {
	function new(?width:Int, ?height:Int):Void;

	var width:Int;
	var height:Int;
}
