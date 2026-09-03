package spilehx.hxopencv.core;

@:native("cv.IntVector")
extern class IntVector implements CvDisposable {
	function new():Void;
	function get(index:Int):Int;
	function push_back(value:Int):Void;
	function set(index:Int, value:Int):Void;
	function resize(size:Int):Void;
	function size():Int;
	@:native("delete") function delete():Void;
}
