package spilehx.hxopencv.features;

import spilehx.hxopencv.core.CvDisposable;

@:native("cv.KeyPointVectorVector")
extern class KeyPointVectorVector implements CvDisposable {
	function new():Void;
	function get(index:Int):KeyPointVector;
	function push_back(value:KeyPointVector):Void;
	function set(index:Int, value:KeyPointVector):Void;
	function resize(size:Int):Void;
	function size():Int;
	@:native("delete") function delete():Void;
}
