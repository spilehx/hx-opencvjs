package spilehx.hxopencv.dnn;

class DnnConstants {
	public static inline var BACKEND_DEFAULT:Int = 0;
	public static inline var BACKEND_INFERENCE_ENGINE:Int = 2;
	public static inline var BACKEND_OPENCV:Int = 3;
	public static inline var BACKEND_VKCOM:Int = 4;
	public static inline var BACKEND_CUDA:Int = 5;
	public static inline var BACKEND_WEBNN:Int = 6;
	public static inline var BACKEND_TIMVX:Int = 7;
	public static inline var BACKEND_CANN:Int = 8;
	public static inline var TARGET_CPU:Int = 0;
	public static inline var TARGET_OPENCL:Int = 1;
	public static inline var TARGET_OPENCL_FP16:Int = 2;
	public static inline var TARGET_MYRIAD:Int = 3;
	public static inline var TARGET_VULKAN:Int = 4;
	public static inline var TARGET_FPGA:Int = 5;
	public static inline var TARGET_CUDA:Int = 6;
	public static inline var TARGET_CUDA_FP16:Int = 7;
	public static inline var TARGET_HDDL:Int = 8;
	public static inline var TARGET_NPU:Int = 9;
	public static inline var TARGET_CPU_FP16:Int = 10;
	public static inline var LAYOUT_UNKNOWN:Int = 0;
	public static inline var LAYOUT_ND:Int = 1;
	public static inline var LAYOUT_NCHW:Int = 2;
	public static inline var LAYOUT_NCDHW:Int = 3;
	public static inline var LAYOUT_NHWC:Int = 4;
	public static inline var LAYOUT_NDHWC:Int = 5;
	public static inline var LAYOUT_PLANAR:Int = 6;
	public static inline var LAYOUT_BLOCK:Int = 7;
	public static inline var MODEL_GENERIC:Int = 0;
	public static inline var MODEL_ONNX:Int = 1;
	public static inline var MODEL_TF:Int = 2;
	public static inline var MODEL_TFLITE:Int = 3;
}
