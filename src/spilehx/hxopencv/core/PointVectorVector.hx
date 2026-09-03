package spilehx.hxopencv.core;

@:native("cv.PointVectorVector")
extern class PointVectorVector implements CvDisposable {
	function new():Void;
	function get(index:Int):PointVector;
	function push_back(value:PointVector):Void;
	function set(index:Int, value:PointVector):Void;
	function resize(size:Int):Void;
	function size():Int;
	@:native("delete") function delete():Void;
}
