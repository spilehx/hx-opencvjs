package spilehx.hxopencv.features;

import spilehx.hxopencv.core.CvDisposable;

@:native("cv.DMatchVector")
extern class DMatchVector implements CvDisposable {
	function new():Void;
	function get(index:Int):DMatch;
	function push_back(value:DMatch):Void;
	function set(index:Int, value:DMatch):Void;
	function resize(size:Int):Void;
	function size():Int;
	@:native("delete") function delete():Void;
}
