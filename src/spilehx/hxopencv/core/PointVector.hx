package spilehx.hxopencv.core;

@:native("cv.PointVector")
extern class PointVector implements CvDisposable {
	function new():Void;
	function get(index:Int):Point;
	function push_back(value:Point):Void;
	function set(index:Int, value:Point):Void;
	function resize(size:Int):Void;
	function size():Int;
	@:native("delete") function delete():Void;
}
