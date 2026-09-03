import js.Browser;
import spilehx.hxopencv.HxOpenCV;
import spilehx.hxopencv.core.Core;
import spilehx.hxopencv.core.Mat;
import spilehx.hxopencv.core.MatType;
import spilehx.hxopencv.core.Scalar;

class Main {
	static function main() {
		HxOpenCV.init().then(function(_) {
			var left = new Mat(1, 1, MatType.CV_8UC1, new Scalar(2));
			var right = new Mat(1, 1, MatType.CV_8UC1, new Scalar(5));
			var sum = new Mat();
			Core.add(left, right, sum);

			var mean = Core.mean(sum);
			Browser.document.getElementById("result").textContent = 'OpenCV is ready: 2 + 5 = ${mean[0]}';

			sum.delete();
			right.delete();
			left.delete();
		});
	}
}
