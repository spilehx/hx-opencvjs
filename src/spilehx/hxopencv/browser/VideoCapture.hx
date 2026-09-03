package spilehx.hxopencv.browser;

import spilehx.hxopencv.core.Mat;
import spilehx.hxopencv.browser.BrowserTypes.VideoSource;

@:native("cv.VideoCapture")
extern class VideoCapture {
	function new(source:VideoSource):Void;
	function read(frame:Mat):Void;
}
