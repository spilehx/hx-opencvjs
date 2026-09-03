package spilehx.hxopencv.features;

import spilehx.hxopencv.core.CvDisposable;

@:native("cv.DMatchVectorVector")
extern class DMatchVectorVector implements CvDisposable {
	function new():Void;
	function get(index:Int):DMatchVector;
	function push_back(value:DMatchVector):Void;
	function set(index:Int, value:DMatchVector):Void;
	function resize(size:Int):Void;
	function size():Int;
	@:native("delete") function delete():Void;
}
