package spilehx.hxopencv.dnn;

import spilehx.hxopencv.core.CvDisposable;
import spilehx.hxopencv.core.Mat;
import spilehx.hxopencv.core.MatVector;
import spilehx.hxopencv.core.Scalar;
import spilehx.hxopencv.core.StringVector;

@:native("cv.dnn_Net")
extern class DnnNet implements CvDisposable {
	function setInput(blob:Mat, ?name:String, ?scalefactor:Float, ?mean:Scalar):Void;
	function setPreferableBackend(backendId:Int):Void;
	function setPreferableTarget(targetId:Int):Void;
	function getUnconnectedOutLayersNames():StringVector;
	function forward(?outputName:String):Mat;
	@:native("forward1") function forwardTo(outputBlobs:MatVector, ?outputName:String):Void;
	@:native("forward2") function forwardMany(outputBlobs:MatVector, outBlobNames:StringVector):Void;
	@:native("delete") function delete():Void;
}
