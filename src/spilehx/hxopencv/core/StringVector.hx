package spilehx.hxopencv.core;

@:native("cv.StringVector")
extern class StringVector implements CvDisposable {
	function new():Void;
	function get(index:Int):String;
	function push_back(value:String):Void;
	function set(index:Int, value:String):Void;
	function resize(size:Int):Void;
	function size():Int;
	@:native("delete") function delete():Void;
}
