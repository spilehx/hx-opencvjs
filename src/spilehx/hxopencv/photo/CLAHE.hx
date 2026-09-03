package spilehx.hxopencv.photo;

import spilehx.hxopencv.core.CvDisposable;
import spilehx.hxopencv.core.Mat;
import spilehx.hxopencv.core.Size;

@:native("cv.CLAHE")
extern class CLAHE implements CvDisposable {
	function new(?clipLimit:Float, ?tileGridSize:Size):Void;
	function apply(src:Mat, dst:Mat):Void;
	function collectGarbage():Void;
	function getClipLimit():Float;
	function getTilesGridSize():Size;
	function setClipLimit(value:Float):Void;
	function setTilesGridSize(value:Size):Void;
	@:native("delete") function delete():Void;
}
