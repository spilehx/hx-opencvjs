package spilehx.hxopencv.detection;

import spilehx.hxopencv.core.CvDisposable;
import spilehx.hxopencv.core.Mat;
import spilehx.hxopencv.core.StringVector;

@:native("cv.barcode_BarcodeDetector")
extern class BarcodeDetector implements CvDisposable {
	function new():Void;
	function detectAndDecodeWithType(image:Mat, decodedInfo:StringVector, decodedType:StringVector, points:Mat):Bool;
	function decodeWithType(image:Mat, decodedInfo:StringVector, decodedType:StringVector, points:Mat):Bool;
	@:native("delete") function delete():Void;
}
