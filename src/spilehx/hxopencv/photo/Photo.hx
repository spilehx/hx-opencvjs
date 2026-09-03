package spilehx.hxopencv.photo;

import spilehx.hxopencv.core.Mat;

@:native("cv")
extern class Photo {
	static function inpaint(src:Mat, inpaintMask:Mat, dst:Mat, inpaintRadius:Float, flags:Int):Void;
}
