import js.Browser;
import js.html.ImageData;
import spilehx.hxopencv.HxOpenCV;
import spilehx.hxopencv.browser.ImgIo;
import spilehx.hxopencv.core.Mat;
import spilehx.hxopencv.imgproc.ColorConversion;
import spilehx.hxopencv.imgproc.Imgproc;

class Main {
	static function main() {
		HxOpenCV.init().then(function(_) {
			var image = new ImageData(96, 64);
			for (y in 0...image.height) {
				for (x in 0...image.width) {
					var offset = (y * image.width + x) * 4;
					var circle = (x - 70) * (x - 70) + (y - 32) * (y - 32) < 196;
					var rectangle = x > 16 && x < 48 && y > 12 && y < 52;
					var value = circle || rectangle ? 255 : 0;
					image.data[offset] = value;
					image.data[offset + 1] = value;
					image.data[offset + 2] = value;
					image.data[offset + 3] = 255;
				}
			}

			var color = ImgIo.matFromImageData(image);
			var grayscale = new Mat();
			var edges = new Mat();
			Imgproc.cvtColor(color, grayscale, ColorConversion.RGBA2GRAY);
			Imgproc.Canny(grayscale, edges, 50, 150);
			ImgIo.imshow(cast Browser.document.getElementById("edges"), edges);

			edges.delete();
			grayscale.delete();
			color.delete();
		});
	}
}
