import js.Browser;
import js.html.ImageData;
import spilehx.hxopencv.HxOpenCV;
import spilehx.hxopencv.browser.ImgIo;

class Main {
	static function main() {
		HxOpenCV.init().then(function(_) {
			var image = new ImageData(96, 64);
			for (y in 0...image.height) {
				for (x in 0...image.width) {
					var offset = (y * image.width + x) * 4;
					image.data[offset] = Std.int(x * 255 / image.width);
					image.data[offset + 1] = Std.int(y * 255 / image.height);
					image.data[offset + 2] = 180;
					image.data[offset + 3] = 255;
				}
			}

			var mat = ImgIo.matFromImageData(image);
			ImgIo.imshow(cast Browser.document.getElementById("image"), mat);
			mat.delete();
		});
	}
}
