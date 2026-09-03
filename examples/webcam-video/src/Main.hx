import js.Browser;
import js.html.VideoElement;
import spilehx.hxopencv.HxOpenCV;
import spilehx.hxopencv.browser.ImgIo;
import spilehx.hxopencv.browser.VideoCapture;
import spilehx.hxopencv.core.Mat;
import spilehx.hxopencv.core.MatType;
import spilehx.hxopencv.imgproc.ColorConversion;
import spilehx.hxopencv.imgproc.Imgproc;

class Main {
	static function main() {
		HxOpenCV.init().then(function(_) {
			var example = new WebCamExample();
			example.start();
		});
	}
}

class WebCamExample {
	var video:VideoElement; // = cast Browser.document.getElementById("video");
	var output:Dynamic;
	var status:Dynamic;

	public function new() {
		video = cast Browser.document.getElementById("video");
		output = Browser.document.getElementById("output");
		status = Browser.document.getElementById("status");
	}

	public function start() {
		Browser.navigator.mediaDevices.getUserMedia({video: true, audio: false}).then(function(stream) {
			video.onloadedmetadata = function(_) {
				video.play().then(function(_) {
					video.width = video.videoWidth;
					video.height = video.videoHeight;
					var frame = new Mat(video.height, video.width, MatType.CV_8UC4);
					var grayscale = new Mat();
					var capture = new VideoCapture(video);
					var active = true;
					var stop = function(_) {
						active = false;
						grayscale.delete();
						frame.delete();
						for (track in stream.getTracks()) {
							track.stop();
						}
					};

					Browser.window.addEventListener("beforeunload", stop);
					status.textContent = "Processing webcam video";

					var process:Float->Void = null;
					process = function(_) {
						if (!active)
							return;
						capture.read(frame);
						Imgproc.cvtColor(frame, grayscale, ColorConversion.RGBA2GRAY);
						ImgIo.imshow(cast output, grayscale);
						Browser.window.requestAnimationFrame(process);
					};
					Browser.window.requestAnimationFrame(process);
				}).catchError(function(_) {
					status.textContent = "Unable to start webcam video.";
				});
			};
			video.srcObject = stream;
		}).catchError(function(_) {
			status.textContent = "Webcam access was not granted.";
		});
	}
}
