package spilehx.hxopencv.core;

@:native("cv.Rect")
extern class Rect {
	@:overload(function(x:Int, y:Int, width:Int, height:Int):Void {})
	function new():Void;

	var x:Float;
	var y:Float;
	var width:Float;
	var height:Float;
}
