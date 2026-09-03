package spilehx.hxopencv.calib;

class CalibConstants {
	public static inline var USE_INTRINSIC_GUESS:Int = 1;
	public static inline var FIX_ASPECT_RATIO:Int = 2;
	public static inline var FIX_PRINCIPAL_POINT:Int = 4;
	public static inline var ZERO_TANGENT_DIST:Int = 8;
	public static inline var FIX_FOCAL_LENGTH:Int = 16;
	public static inline var FIX_K1:Int = 32;
	public static inline var FIX_K2:Int = 64;
	public static inline var FIX_K3:Int = 128;
	public static inline var FIX_INTRINSIC:Int = 256;
	public static inline var SAME_FOCAL_LENGTH:Int = 512;
	public static inline var ZERO_DISPARITY:Int = 1024;
	public static inline var RATIONAL_MODEL:Int = 16384;
	public static inline var THIN_PRISM_MODEL:Int = 32768;
	public static inline var USE_LU:Int = 131072;
	public static inline var USE_QR:Int = 1048576;
	public static inline var FIX_TANGENT_DIST:Int = 2097152;
	public static inline var USE_EXTRINSIC_GUESS:Int = 4194304;
	public static inline var RECOMPUTE_EXTRINSIC:Int = 8388608;
	public static inline var CHECK_COND:Int = 16777216;
	public static inline var FIX_SKEW:Int = 33554432;

	public static inline var SOLVEPNP_ITERATIVE:Int = 0;
	public static inline var SOLVEPNP_EPNP:Int = 1;
	public static inline var SOLVEPNP_P3P:Int = 2;
	public static inline var SOLVEPNP_AP3P:Int = 3;
	public static inline var SOLVEPNP_IPPE:Int = 4;
	public static inline var SOLVEPNP_IPPE_SQUARE:Int = 5;
	public static inline var SOLVEPNP_SQPNP:Int = 6;
	public static inline var RANSAC:Int = 8;
	public static inline var LMEDS:Int = 4;
	public static inline var FM_7POINT:Int = 1;
	public static inline var FM_8POINT:Int = 2;
	public static inline var FM_LMEDS:Int = 4;
	public static inline var FM_RANSAC:Int = 8;
	public static inline var USAC_DEFAULT:Int = 32;
	public static inline var USAC_PARALLEL:Int = 33;
	public static inline var USAC_FM_8PTS:Int = 34;
	public static inline var USAC_FAST:Int = 35;
	public static inline var USAC_ACCURATE:Int = 36;
	public static inline var USAC_PROSAC:Int = 37;
	public static inline var USAC_MAGSAC:Int = 38;
}
