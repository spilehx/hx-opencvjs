package spilehx.hxopencv.core;

@:native("cv.MatVector")
extern class MatVector implements CvDisposable {
	function new():Void;

	function get(index:Int):Mat;
	function push_back(value:Mat):Void;
	function set(index:Int, value:Mat):Void;
	function resize(size:Int):Void;
	function size():Int;

	@:native("delete")
	function delete():Void;
}
