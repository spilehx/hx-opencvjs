package spilehx.hxopencv.core;

@:native("cv.CharVectorVector")
extern class CharVectorVector implements CvDisposable {
	function new():Void;
	function get(index:Int):CharVector;
	function push_back(value:CharVector):Void;
	function set(index:Int, value:CharVector):Void;
	function resize(size:Int):Void;
	function size():Int;
	@:native("delete") function delete():Void;
}
