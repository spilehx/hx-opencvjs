import js.Browser;
import js.html.ImageData;
import spilehx.hxopencv.HxOpenCV;
import spilehx.hxopencv.browser.ImgIo;
import spilehx.hxopencv.core.Mat;
import spilehx.hxopencv.core.Size;
import spilehx.hxopencv.imgproc.ColorConversion;
import spilehx.hxopencv.imgproc.Imgproc;

class Main {
	static function main() {
		HxOpenCV.init().then(function(_) {
			var image = new ImageData(96, 64);
			for (y in 0...image.height) {
				for (x in 0...image.width) {
					var offset = (y * image.width + x) * 4;
					image.data[offset] = Std.int(x * 255 / image.width);
					image.data[offset + 1] = x < 48 ? 220 : 40;
					image.data[offset + 2] = Std.int(y * 255 / image.height);
					image.data[offset + 3] = 255;
				}
			}

			var color = ImgIo.matFromImageData(image);
			var grayscale = new Mat();
			var resized = new Mat();
			ImgIo.imshow(cast Browser.document.getElementById("original"), color);
			Imgproc.cvtColor(color, grayscale, ColorConversion.RGBA2GRAY);
			Imgproc.resize(grayscale, resized, new Size(48, 32));
			ImgIo.imshow(cast Browser.document.getElementById("processed"), resized);

			resized.delete();
			grayscale.delete();
			color.delete();
		});
	}
}
