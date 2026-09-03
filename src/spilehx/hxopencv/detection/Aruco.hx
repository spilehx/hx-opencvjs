package spilehx.hxopencv.detection;

import spilehx.hxopencv.core.CvDisposable;
import spilehx.hxopencv.core.Mat;
import spilehx.hxopencv.core.MatVector;
import spilehx.hxopencv.core.Scalar;
import spilehx.hxopencv.core.Size;

@:native("cv.aruco_Dictionary")
extern class ArucoDictionary implements CvDisposable {
	function new():Void;
	var bytesList:Mat;
	var markerSize:Int;
	var maxCorrectionBits:Int;
	function generateImageMarker(id:Int, sidePixels:Int, img:Mat, ?borderBits:Int):Void;
	function getDistanceToId(bits:Mat, id:Int, ?allRotations:Bool):Int;
	@:native("delete") function delete():Void;
}

@:native("cv.aruco_DetectorParameters")
extern class ArucoDetectorParameters implements CvDisposable {
	function new():Void;
	var adaptiveThreshConstant:Float;
	var adaptiveThreshWinSizeMax:Int;
	var adaptiveThreshWinSizeMin:Int;
	var adaptiveThreshWinSizeStep:Int;
	var cornerRefinementMethod:Int;
	var cornerRefinementWinSize:Int;
	var detectInvertedMarker:Bool;
	var markerBorderBits:Int;
	var minDistanceToBorder:Int;
	var minMarkerPerimeterRate:Float;
	var maxMarkerPerimeterRate:Float;
	var polygonalApproxAccuracyRate:Float;
	@:native("delete") function delete():Void;
}

@:native("cv.aruco_RefineParameters")
extern class ArucoRefineParameters implements CvDisposable {
	function new(minRepDistance:Float, errorCorrectionRate:Float, checkAllOrders:Bool):Void;
	var minRepDistance:Float;
	var errorCorrectionRate:Float;
	var checkAllOrders:Bool;
	@:native("delete") function delete():Void;
}

@:native("cv.aruco_ArucoDetector")
extern class ArucoDetector implements CvDisposable {
	function new(dictionary:ArucoDictionary, ?detectorParams:ArucoDetectorParameters, ?refineParams:ArucoRefineParameters):Void;
	function detectMarkers(image:Mat, corners:MatVector, ids:Mat, ?rejectedImgPoints:MatVector):Void;
	function refineDetectedMarkers(image:Mat, board:ArucoBoard, detectedCorners:MatVector, detectedIds:Mat, rejectedCorners:MatVector, ?cameraMatrix:Mat, ?distCoeffs:Mat, ?recoveredIdxs:Mat):Void;
	function setDetectorParameters(value:ArucoDetectorParameters):Void;
	function setDictionary(value:ArucoDictionary):Void;
	function setRefineParameters(value:ArucoRefineParameters):Void;
	@:native("delete") function delete():Void;
}

@:native("cv.aruco_Board")
extern class ArucoBoard implements CvDisposable {
	function generateImage(outSize:Size, img:Mat, ?marginSize:Int, ?borderBits:Int):Void;
	function matchImagePoints(detectedCorners:MatVector, detectedIds:Mat, objPoints:Mat, imgPoints:Mat):Void;
	@:native("delete") function delete():Void;
}

@:native("cv.aruco_GridBoard")
extern class ArucoGridBoard implements CvDisposable {
	function new(size:Size, markerLength:Float, markerSeparation:Float, dictionary:ArucoDictionary, ids:Mat):Void;
	function getGridSize():Size;
	function getMarkerLength():Float;
	function getMarkerSeparation():Float;
	function generateImage(outSize:Size, img:Mat, ?marginSize:Int, ?borderBits:Int):Void;
	@:native("delete") function delete():Void;
}

@:native("cv.aruco_CharucoParameters")
extern class CharucoParameters implements CvDisposable {
	function new():Void;
	var cameraMatrix:Mat;
	var checkMarkers:Bool;
	var distCoeffs:Mat;
	var minMarkers:Int;
	var tryRefineMarkers:Bool;
	@:native("delete") function delete():Void;
}

@:native("cv.aruco_CharucoBoard")
extern class CharucoBoard implements CvDisposable {
	function new(size:Size, squareLength:Float, markerLength:Float, dictionary:ArucoDictionary, ids:Mat):Void;
	function checkCharucoCornersCollinear(charucoIds:Mat):Bool;
	function getChessboardCorners():Mat;
	function getLegacyPattern():Bool;
	function setLegacyPattern(value:Bool):Void;
	function generateImage(outSize:Size, img:Mat, ?marginSize:Int, ?borderBits:Int):Void;
	@:native("delete") function delete():Void;
}

@:native("cv.aruco_CharucoDetector")
extern class CharucoDetector implements CvDisposable {
	function new(board:CharucoBoard, charucoParams:CharucoParameters, detectorParams:ArucoDetectorParameters, refineParams:ArucoRefineParameters):Void;
	function detectBoard(image:Mat, charucoCorners:Mat, charucoIds:Mat, ?markerCorners:MatVector, ?markerIds:Mat):Void;
	function detectDiamonds(image:Mat, diamondCorners:MatVector, diamondIds:Mat, ?markerCorners:MatVector, ?markerIds:Mat):Void;
	function setBoard(value:CharucoBoard):Void;
	function setCharucoParameters(value:CharucoParameters):Void;
	function setDetectorParameters(value:ArucoDetectorParameters):Void;
	function setRefineParameters(value:ArucoRefineParameters):Void;
	@:native("delete") function delete():Void;
}

@:native("cv")
extern class Aruco {
	static function getPredefinedDictionary(dictionary:Int):ArucoDictionary;
	static function drawDetectedMarkers(image:Mat, corners:MatVector, ?ids:Mat, ?borderColor:Scalar):Void;
	static function drawDetectedCornersCharuco(image:Mat, charucoCorners:Mat, charucoIds:Mat, ?cornerColor:Scalar):Void;
}

class ArucoDictionaryType {
	public static inline var DICT_4X4_50:Int = 0;
	public static inline var DICT_4X4_100:Int = 1;
	public static inline var DICT_4X4_250:Int = 2;
	public static inline var DICT_4X4_1000:Int = 3;
	public static inline var DICT_5X5_50:Int = 4;
	public static inline var DICT_5X5_100:Int = 5;
	public static inline var DICT_5X5_250:Int = 6;
	public static inline var DICT_5X5_1000:Int = 7;
	public static inline var DICT_6X6_50:Int = 8;
	public static inline var DICT_6X6_100:Int = 9;
	public static inline var DICT_6X6_250:Int = 10;
	public static inline var DICT_6X6_1000:Int = 11;
	public static inline var DICT_7X7_50:Int = 12;
	public static inline var DICT_7X7_100:Int = 13;
	public static inline var DICT_7X7_250:Int = 14;
	public static inline var DICT_7X7_1000:Int = 15;
	public static inline var DICT_ARUCO_ORIGINAL:Int = 16;
	public static inline var DICT_APRILTAG_16h5:Int = 17;
	public static inline var DICT_APRILTAG_25h9:Int = 18;
	public static inline var DICT_APRILTAG_36h10:Int = 19;
	public static inline var DICT_APRILTAG_36h11:Int = 20;
	public static inline var DICT_ARUCO_MIP_36h12:Int = 21;
}

class ArucoCornerRefinement {
	public static inline var NONE:Int = 0;
	public static inline var SUBPIX:Int = 1;
	public static inline var CONTOUR:Int = 2;
	public static inline var APRILTAG:Int = 3;
}
