package spilehx.hxopencv.core;

@:native("cv.RectVector")
extern class RectVector implements CvDisposable {
	function new():Void;
	function get(index:Int):Rect;
	function push_back(value:Rect):Void;
	function set(index:Int, value:Rect):Void;
	function resize(size:Int):Void;
	function size():Int;
	@:native("delete") function delete():Void;
}
