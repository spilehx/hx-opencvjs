package spilehx.hxopencv.calib;

import spilehx.hxopencv.core.Mat;
import spilehx.hxopencv.core.MatVector;
import spilehx.hxopencv.core.Size;
import spilehx.hxopencv.core.TermCriteria;

@:native("cv")
extern class Calib3d {
	static function calibrateCameraExtended(objectPoints:MatVector, imagePoints:MatVector, imageSize:Size, cameraMatrix:Mat, distCoeffs:Mat, rvecs:MatVector, tvecs:MatVector, stdDeviationsIntrinsics:Mat, stdDeviationsExtrinsics:Mat, perViewErrors:Mat, ?flags:Int, ?criteria:TermCriteria):Float;
	static function drawFrameAxes(image:Mat, cameraMatrix:Mat, distCoeffs:Mat, rvec:Mat, tvec:Mat, length:Float, ?thickness:Int):Void;

	static function estimateAffine2D(from:Mat, to:Mat, ?inliers:Mat, ?method:Int, ?ransacReprojThreshold:Float, ?maxIters:Int, ?confidence:Float, ?refineIters:Int):Mat;
	@:native("estimateAffine2D1")
	static function estimateAffine2DUsac(from:Mat, to:Mat, inliers:Mat, params:UsacParams):Mat;
	static function findHomography(srcPoints:Mat, dstPoints:Mat, ?method:Int, ?ransacReprojThreshold:Float, ?mask:Mat, ?maxIters:Int, ?confidence:Float):Mat;
	@:native("findHomography1")
	static function findHomographyUsac(srcPoints:Mat, dstPoints:Mat, mask:Mat, params:UsacParams):Mat;

	static function projectPoints(objectPoints:Mat, rvec:Mat, tvec:Mat, cameraMatrix:Mat, distCoeffs:Mat, imagePoints:Mat, ?jacobian:Mat, ?aspectRatio:Float):Void;
	static function Rodrigues(src:Mat, dst:Mat, ?jacobian:Mat):Void;
	static function solvePnP(objectPoints:Mat, imagePoints:Mat, cameraMatrix:Mat, distCoeffs:Mat, rvec:Mat, tvec:Mat, ?useExtrinsicGuess:Bool, ?flags:Int):Bool;
	static function solvePnPRansac(objectPoints:Mat, imagePoints:Mat, cameraMatrix:Mat, distCoeffs:Mat, rvec:Mat, tvec:Mat, ?useExtrinsicGuess:Bool, ?iterationsCount:Int, ?reprojectionError:Float, ?confidence:Float, ?inliers:Mat, ?flags:Int):Bool;
	@:native("solvePnPRansac1")
	static function solvePnPRansacUsac(objectPoints:Mat, imagePoints:Mat, cameraMatrix:Mat, distCoeffs:Mat, rvec:Mat, tvec:Mat, inliers:Mat, params:UsacParams):Bool;
	static function solvePnPRefineLM(objectPoints:Mat, imagePoints:Mat, cameraMatrix:Mat, distCoeffs:Mat, rvec:Mat, tvec:Mat, ?criteria:TermCriteria):Void;

	static function undistort(src:Mat, dst:Mat, cameraMatrix:Mat, distCoeffs:Mat, ?newCameraMatrix:Mat):Void;
	static function initUndistortRectifyMap(cameraMatrix:Mat, distCoeffs:Mat, R:Mat, newCameraMatrix:Mat, size:Size, m1type:Int, map1:Mat, map2:Mat):Void;
	@:native("fisheye_initUndistortRectifyMap")
	static function fisheyeInitUndistortRectifyMap(cameraMatrix:Mat, distCoeffs:Mat, R:Mat, newCameraMatrix:Mat, size:Size, m1type:Int, map1:Mat, map2:Mat):Void;
	@:native("fisheye_projectPoints")
	static function fisheyeProjectPoints(objectPoints:Mat, imagePoints:Mat, rvec:Mat, tvec:Mat, cameraMatrix:Mat, distCoeffs:Mat, ?alpha:Float, ?jacobian:Mat):Void;
}
