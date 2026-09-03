package spilehx.hxopencv.video;

import spilehx.hxopencv.core.Mat;
import spilehx.hxopencv.core.Size;
import spilehx.hxopencv.core.TermCriteria;

@:native("cv")
extern class Video {
	static function calcOpticalFlowFarneback(prev:Mat, next:Mat, flow:Mat, pyrScale:Float, levels:Int, winsize:Int, iterations:Int, polyN:Int, polySigma:Float, flags:Int):Void;
	static function calcOpticalFlowPyrLK(prevImg:Mat, nextImg:Mat, prevPts:Mat, nextPts:Mat, status:Mat, err:Mat, ?winSize:Size, ?maxLevel:Int, ?criteria:TermCriteria, ?flags:Int, ?minEigThreshold:Float):Void;
}
