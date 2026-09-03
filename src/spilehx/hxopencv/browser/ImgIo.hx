package spilehx.hxopencv.browser;

import js.html.ImageData;
import js.lib.ArrayBufferView;
import haxe.extern.EitherType;
import spilehx.hxopencv.browser.BrowserTypes.CanvasSource;
import spilehx.hxopencv.browser.BrowserTypes.ImageSource;
import spilehx.hxopencv.core.Mat;

typedef MatArray = EitherType<Array<Float>, ArrayBufferView>;

@:native("cv")
extern class ImgIo {
	static function matFromArray(rows:Int, cols:Int, type:Int, array:MatArray):Mat;
	static function matFromImageData(imageData:ImageData):Mat;
	static function imread(source:ImageSource):Mat;
	static function imshow(source:CanvasSource, mat:Mat):Void;
}
