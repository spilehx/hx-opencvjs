package spilehx.hxopencv.core;

@:native("cv.FloatVector")
extern class FloatVector implements CvDisposable {
	function new():Void;
	function get(index:Int):Float;
	function push_back(value:Float):Void;
	function set(index:Int, value:Float):Void;
	function resize(size:Int):Void;
	function size():Int;
	@:native("delete") function delete():Void;
}
