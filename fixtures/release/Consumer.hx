import js.lib.Float32Array;
import js.lib.Uint8Array;
import spilehx.hxopencv.HxOpenCV;
import spilehx.hxopencv.browser.ImgIo;
import spilehx.hxopencv.calib.Calib3d;
import spilehx.hxopencv.core.CoreExtra;
import spilehx.hxopencv.core.Mat;
import spilehx.hxopencv.core.MatType;
import spilehx.hxopencv.core.Size;
import spilehx.hxopencv.detection.QRCodeDetector;
import spilehx.hxopencv.dnn.Dnn;
import spilehx.hxopencv.features.KeyPointVector;
import spilehx.hxopencv.features.ORB;
import spilehx.hxopencv.imgproc.Imgproc;
import spilehx.hxopencv.photo.CLAHE;
import spilehx.hxopencv.video.BackgroundSubtractorMOG2;

class Consumer {
	static function main():Void {
		HxOpenCV.init().then(function(_) {
			var first = ImgIo.matFromArray(2, 2, MatType.CV_8UC1, new Uint8Array([1, 2, 3, 4]));
			var second = ImgIo.matFromArray(2, 2, MatType.CV_8UC1, new Uint8Array([4, 3, 2, 1]));
			var floating = ImgIo.matFromArray(2, 2, MatType.CV_32FC1, new Float32Array([1, 2, 3, 4]));
			var rotationVector = ImgIo.matFromArray(3, 1, MatType.CV_32FC1, new Float32Array([0, 0, 0]));
			var result = new Mat();
			CoreExtra.absdiff(first, second, result);
			CoreExtra.addWeighted(first, .5, second, .5, 0, result);
			Imgproc.cornerHarris(first, result, 2, 3, .04);
			Imgproc.createHanningWindow(result, new Size(2, 2), MatType.CV_32FC1);

			var keypoints = new KeyPointVector();
			var orb = new ORB();
			orb.detect(first, keypoints);
			var foreground = new Mat();
			var subtractor = new BackgroundSubtractorMOG2();
			subtractor.apply(first, foreground);
			var points = new Mat();
			var detector = new QRCodeDetector();
			detector.detect(first, points);
			var clahe = new CLAHE();
			clahe.apply(first, result);
			var blob = Dnn.blobFromImage(first);
			var rotation = new Mat();
			Calib3d.Rodrigues(rotationVector, rotation);

			if (result.rows != 2 || foreground.rows != 2 || rotation.rows != 3) throw "release smoke test returned an unexpected result";
			first.delete(); second.delete(); floating.delete(); rotationVector.delete(); result.delete(); keypoints.delete(); orb.delete(); foreground.delete(); subtractor.delete(); points.delete(); detector.delete(); clahe.delete(); blob.delete(); rotation.delete();
			js.Syntax.code("globalThis.__hxOpenCvReleaseReady = true");
		});
	}
}
