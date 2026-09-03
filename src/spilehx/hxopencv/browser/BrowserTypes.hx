package spilehx.hxopencv.browser;

import js.html.CanvasElement;
import js.html.ImageElement;
import js.html.VideoElement;
import haxe.extern.EitherType;

typedef CanvasSource = EitherType<String, CanvasElement>;
typedef ImageSource = EitherType<String, EitherType<ImageElement, CanvasElement>>;
typedef VideoSource = EitherType<String, VideoElement>;
