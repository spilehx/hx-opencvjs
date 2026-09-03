package spilehx.hxopencv.features;

import spilehx.hxopencv.core.CvDisposable;

@:native("cv.KeyPointVector")
extern class KeyPointVector implements CvDisposable {
	function new():Void;
	function get(index:Int):KeyPoint;
	function push_back(value:KeyPoint):Void;
	function set(index:Int, value:KeyPoint):Void;
	function resize(size:Int):Void;
	function size():Int;
	@:native("delete") function delete():Void;
}
