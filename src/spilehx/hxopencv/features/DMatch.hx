package spilehx.hxopencv.features;

@:native("cv.DMatch")
extern class DMatch {
	function new(?queryIdx:Int, ?trainIdx:Int, ?imgIdx:Int, ?distance:Float):Void;

	var queryIdx:Int;
	var trainIdx:Int;
	var imgIdx:Int;
	var distance:Float;
}
