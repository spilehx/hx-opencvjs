package spilehx.hxopencv.imgproc;

import spilehx.hxopencv.core.Mat;
import spilehx.hxopencv.core.MatVector;
import spilehx.hxopencv.core.Circle;
import spilehx.hxopencv.core.MinMaxLoc;
import spilehx.hxopencv.core.Point;
import spilehx.hxopencv.core.Rect;
import spilehx.hxopencv.core.RotatedRect;
import spilehx.hxopencv.core.Scalar;
import spilehx.hxopencv.core.Size;

@:native("cv")
extern class Imgproc {
	// Color conversion.
	static function cvtColor(src:Mat, dst:Mat, code:Int, ?dstCn:Int):Void;
	static function demosaicing(src:Mat, dst:Mat, code:Int, ?dstCn:Int):Void;
	static function applyColorMap(src:Mat, dst:Mat, colormap:Int):Void;
	@:native("applyColorMap1")
	static function applyCustomColorMap(src:Mat, dst:Mat, userColor:Mat):Void;

	// Filtering.
	static function blur(src:Mat, dst:Mat, ksize:Size, ?anchor:Point, ?borderType:Int):Void;
	static function boxFilter(src:Mat, dst:Mat, ddepth:Int, ksize:Size, ?anchor:Point, ?normalize:Bool, ?borderType:Int):Void;
	static function sqrBoxFilter(src:Mat, dst:Mat, ddepth:Int, ksize:Size, ?anchor:Point, ?normalize:Bool, ?borderType:Int):Void;
	static function GaussianBlur(src:Mat, dst:Mat, ksize:Size, sigmaX:Float, ?sigmaY:Float, ?borderType:Int):Void;
	static function medianBlur(src:Mat, dst:Mat, ksize:Int):Void;
	static function bilateralFilter(src:Mat, dst:Mat, d:Int, sigmaColor:Float, sigmaSpace:Float, ?borderType:Int):Void;
	static function filter2D(src:Mat, dst:Mat, ddepth:Int, kernel:Mat, ?anchor:Point, ?delta:Float, ?borderType:Int):Void;
	static function sepFilter2D(src:Mat, dst:Mat, ddepth:Int, kernelX:Mat, kernelY:Mat, ?anchor:Point, ?delta:Float, ?borderType:Int):Void;
	static function Sobel(src:Mat, dst:Mat, ddepth:Int, dx:Int, dy:Int, ?ksize:Int, ?scale:Float, ?delta:Float, ?borderType:Int):Void;
	static function Scharr(src:Mat, dst:Mat, ddepth:Int, dx:Int, dy:Int, ?scale:Float, ?delta:Float, ?borderType:Int):Void;
	static function Laplacian(src:Mat, dst:Mat, ddepth:Int, ?ksize:Int, ?scale:Float, ?delta:Float, ?borderType:Int):Void;
	static function Canny(image:Mat, edges:Mat, threshold1:Float, threshold2:Float, ?apertureSize:Int, ?L2gradient:Bool):Void;
	@:native("Canny1")
	static function CannyDerivative(dx:Mat, dy:Mat, edges:Mat, threshold1:Float, threshold2:Float, ?L2gradient:Bool):Void;
	static function cornerHarris(src:Mat, dst:Mat, blockSize:Int, ksize:Int, k:Float, ?borderType:Int):Void;
	static function cornerMinEigenVal(src:Mat, dst:Mat, blockSize:Int, ?ksize:Int, ?borderType:Int):Void;
	static function preCornerDetect(src:Mat, dst:Mat, ksize:Int, ?borderType:Int):Void;
	static function spatialGradient(src:Mat, dx:Mat, dy:Mat, ?ksize:Int, ?borderType:Int):Void;

	// Morphology.
	static function getStructuringElement(shape:Int, ksize:Size, ?anchor:Point):Mat;
	static function erode(src:Mat, dst:Mat, kernel:Mat, ?anchor:Point, ?iterations:Int, ?borderType:Int, ?borderValue:Scalar):Void;
	static function dilate(src:Mat, dst:Mat, kernel:Mat, ?anchor:Point, ?iterations:Int, ?borderType:Int, ?borderValue:Scalar):Void;
	static function morphologyEx(src:Mat, dst:Mat, op:Int, kernel:Mat, ?anchor:Point, ?iterations:Int, ?borderType:Int, ?borderValue:Scalar):Void;

	// Geometry and warping.
	static function resize(src:Mat, dst:Mat, dsize:Size, ?fx:Float, ?fy:Float, ?interpolation:Int):Void;
	static function getAffineTransform(src:Mat, dst:Mat):Mat;
	static function getPerspectiveTransform(src:Mat, dst:Mat):Mat;
	static function warpAffine(src:Mat, dst:Mat, transform:Mat, dsize:Size, ?flags:Int, ?borderMode:Int, ?borderValue:Scalar):Void;
	static function warpPerspective(src:Mat, dst:Mat, transform:Mat, dsize:Size, ?flags:Int, ?borderMode:Int, ?borderValue:Scalar):Void;
	static function remap(src:Mat, dst:Mat, map1:Mat, map2:Mat, interpolation:Int, ?borderMode:Int, ?borderValue:Scalar):Void;
	static function warpPolar(src:Mat, dst:Mat, dsize:Size, center:Point, maxRadius:Float, flags:Int):Void;
	static function pyrDown(src:Mat, dst:Mat, ?dstsize:Size, ?borderType:Int):Void;
	static function pyrUp(src:Mat, dst:Mat, ?dstsize:Size, ?borderType:Int):Void;
	static function getRotationMatrix2D(center:Point, angle:Float, scale:Float):Mat;
	static function rotate(src:Mat, dst:Mat, rotateCode:Int):Void;

	// Thresholding.
	static function threshold(src:Mat, dst:Mat, thresh:Float, maxval:Float, type:Int):Float;
	static function adaptiveThreshold(src:Mat, dst:Mat, maxValue:Float, adaptiveMethod:Int, thresholdType:Int, blockSize:Int, C:Float):Void;
	static function distanceTransform(src:Mat, dst:Mat, distanceType:Int, maskSize:Int, ?dstType:Int):Void;
	static function distanceTransformWithLabels(src:Mat, dst:Mat, labels:Mat, distanceType:Int, maskSize:Int, labelType:Int):Void;
	static function connectedComponents(image:Mat, labels:Mat, ?connectivity:Int, ?ltype:Int):Int;
	static function connectedComponentsWithStats(image:Mat, labels:Mat, stats:Mat, centroids:Mat, ?connectivity:Int, ?ltype:Int):Int;

	// Contours and shapes.
	static function findContours(image:Mat, contours:MatVector, hierarchy:Mat, mode:Int, method:Int, ?offset:Point):Void;
	static function approxPolyDP(curve:Mat, approxCurve:Mat, epsilon:Float, closed:Bool):Void;
	static function arcLength(curve:Mat, closed:Bool):Float;
	static function contourArea(contour:Mat, ?oriented:Bool):Float;
	static function boundingRect(array:Mat):Rect;
	static function convexHull(points:Mat, hull:Mat, ?clockwise:Bool, ?returnPoints:Bool):Void;
	static function convexityDefects(contour:Mat, convexhull:Mat, convexityDefects:Mat):Void;
	static function isContourConvex(contour:Mat):Bool;
	static function pointPolygonTest(contour:Mat, point:Point, measureDist:Bool):Float;
	static function minAreaRect(points:Mat):RotatedRect;
	static function fitEllipse(points:Mat):RotatedRect;
	static function fitLine(points:Mat, line:Mat, distType:Int, param:Float, reps:Float, aeps:Float):Void;
	static function matchShapes(contour1:Mat, contour2:Mat, method:Int, parameter:Float):Float;
	static function boxPoints(box:RotatedRect):Array<Point>;
	static function minEnclosingCircle(points:Mat):Circle;
	static function minMaxLoc(src:Mat, ?mask:Mat):MinMaxLoc;

	// Drawing.  The Rect and RotatedRect forms are distinct bundled exports.
	static function line(img:Mat, pt1:Point, pt2:Point, color:Scalar, ?thickness:Int, ?lineType:Int, ?shift:Int):Void;
	static function arrowedLine(img:Mat, pt1:Point, pt2:Point, color:Scalar, ?thickness:Int, ?lineType:Int, ?shift:Int, ?tipLength:Float):Void;
	static function circle(img:Mat, center:Point, radius:Int, color:Scalar, ?thickness:Int, ?lineType:Int, ?shift:Int):Void;
	static function rectangle(img:Mat, pt1:Point, pt2:Point, color:Scalar, ?thickness:Int, ?lineType:Int, ?shift:Int):Void;
	@:native("rectangle1")
	static function rectangleRect(img:Mat, rect:Rect, color:Scalar, ?thickness:Int, ?lineType:Int, ?shift:Int):Void;
	static function ellipse(img:Mat, center:Point, axes:Size, angle:Float, startAngle:Float, endAngle:Float, color:Scalar, ?thickness:Int, ?lineType:Int, ?shift:Int):Void;
	@:native("ellipse1")
	static function ellipseRotatedRect(img:Mat, box:RotatedRect, color:Scalar, ?thickness:Int, ?lineType:Int):Void;
	static function polylines(img:Mat, pts:MatVector, isClosed:Bool, color:Scalar, ?thickness:Int, ?lineType:Int, ?shift:Int):Void;
	static function fillPoly(img:Mat, pts:MatVector, color:Scalar, ?lineType:Int, ?shift:Int, ?offset:Point):Void;
	static function fillConvexPoly(img:Mat, points:Mat, color:Scalar, ?lineType:Int, ?shift:Int):Void;
	static function drawContours(image:Mat, contours:MatVector, contourIdx:Int, color:Scalar, ?thickness:Int, ?lineType:Int, ?hierarchy:Mat, ?maxLevel:Int, ?offset:Point):Void;
	static function drawMarker(img:Mat, position:Point, color:Scalar, ?markerType:Int, ?markerSize:Int, ?thickness:Int, ?lineType:Int):Void;
	static function putText(img:Mat, text:String, org:Point, fontFace:Int, fontScale:Float, color:Scalar, ?thickness:Int, ?lineType:Int, ?bottomLeftOrigin:Bool):Void;
	static function createHanningWindow(dst:Mat, winSize:Size, type:Int):Void;

	// Histograms.
	static function equalizeHist(src:Mat, dst:Mat):Void;
	static function calcHist(images:MatVector, channels:Array<Int>, mask:Mat, hist:Mat, histSize:Array<Int>, ranges:Array<Float>, accumulate:Bool):Void;
	static function calcBackProject(images:MatVector, channels:Array<Int>, ranges:Array<Float>, hist:Mat, backProject:Mat, scale:Float):Void;
	static function compareHist(H1:Mat, H2:Mat, method:Int):Float;
	static function matchTemplate(image:Mat, templ:Mat, result:Mat, method:Int, ?mask:Mat):Void;

	// Hough transforms.
	static function HoughLines(image:Mat, lines:Mat, rho:Float, theta:Float, threshold:Int, ?srn:Float, ?stn:Float, ?minTheta:Float, ?maxTheta:Float, ?useEdgeVal:Bool):Void;
	static function HoughLinesP(image:Mat, lines:Mat, rho:Float, theta:Float, threshold:Int, ?minLineLength:Float, ?maxLineGap:Float):Void;
	static function HoughCircles(image:Mat, circles:Mat, method:Int, dp:Float, minDist:Float, ?param1:Float, ?param2:Float, ?minRadius:Int, ?maxRadius:Int):Void;
	static function inRange(src:Mat, lowerb:Mat, upperb:Mat, dst:Mat):Void;
	static function watershed(image:Mat, markers:Mat):Void;
	static function morphologyDefaultBorderValue():Scalar;
}
