package spilehx.hxopencv.core;

interface CvDisposable {
	@:native("delete")
	function delete():Void;
}
