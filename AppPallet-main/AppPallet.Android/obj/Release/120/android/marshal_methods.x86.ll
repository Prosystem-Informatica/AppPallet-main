; ModuleID = 'obj\Release\120\android\marshal_methods.x86.ll'
source_filename = "obj\Release\120\android\marshal_methods.x86.ll"
target datalayout = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i686-unknown-linux-android"


%struct.MonoImage = type opaque

%struct.MonoClass = type opaque

%struct.MarshalMethodsManagedClass = type {
	i32,; uint32_t token
	%struct.MonoClass*; MonoClass* klass
}

%struct.MarshalMethodName = type {
	i64,; uint64_t id
	i8*; char* name
}

%class._JNIEnv = type opaque

%class._jobject = type {
	i8; uint8_t b
}

%class._jclass = type {
	i8; uint8_t b
}

%class._jstring = type {
	i8; uint8_t b
}

%class._jthrowable = type {
	i8; uint8_t b
}

%class._jarray = type {
	i8; uint8_t b
}

%class._jobjectArray = type {
	i8; uint8_t b
}

%class._jbooleanArray = type {
	i8; uint8_t b
}

%class._jbyteArray = type {
	i8; uint8_t b
}

%class._jcharArray = type {
	i8; uint8_t b
}

%class._jshortArray = type {
	i8; uint8_t b
}

%class._jintArray = type {
	i8; uint8_t b
}

%class._jlongArray = type {
	i8; uint8_t b
}

%class._jfloatArray = type {
	i8; uint8_t b
}

%class._jdoubleArray = type {
	i8; uint8_t b
}

; assembly_image_cache
@assembly_image_cache = local_unnamed_addr global [0 x %struct.MonoImage*] zeroinitializer, align 4
; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = local_unnamed_addr constant [140 x i32] [
	i32 34715100, ; 0: Xamarin.Google.Guava.ListenableFuture.dll => 0x211b5dc => 67
	i32 39109920, ; 1: Newtonsoft.Json.dll => 0x254c520 => 36
	i32 57263871, ; 2: Xamarin.Forms.Core.dll => 0x369c6ff => 63
	i32 66706743, ; 3: Syncfusion.SfMaskedEdit.XForms.Android.dll => 0x3f9dd37 => 55
	i32 99762151, ; 4: Syncfusion.Buttons.XForms.dll => 0x5f23fe7 => 51
	i32 182336117, ; 5: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 29
	i32 202702780, ; 6: PCLExt.FileStorage => 0xc14ffbc => 38
	i32 209399409, ; 7: Xamarin.AndroidX.Browser.dll => 0xc7b2e71 => 16
	i32 318968648, ; 8: Xamarin.AndroidX.Activity.dll => 0x13031348 => 60
	i32 321597661, ; 9: System.Numerics => 0x132b30dd => 10
	i32 342366114, ; 10: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 24
	i32 347068432, ; 11: SQLitePCLRaw.lib.e_sqlite3.android.dll => 0x14afd810 => 48
	i32 442521989, ; 12: Xamarin.Essentials => 0x1a605985 => 62
	i32 450948140, ; 13: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 22
	i32 465846621, ; 14: mscorlib => 0x1bc4415d => 6
	i32 469710990, ; 15: System.dll => 0x1bff388e => 9
	i32 525008092, ; 16: SkiaSharp.dll => 0x1f4afcdc => 42
	i32 555173402, ; 17: Syncfusion.SfPicker.XForms.Android => 0x2117461a => 58
	i32 627609679, ; 18: Xamarin.AndroidX.CustomView => 0x2568904f => 20
	i32 690569205, ; 19: System.Xml.Linq.dll => 0x29293ff5 => 13
	i32 719061231, ; 20: Syncfusion.Core.XForms.dll => 0x2adc00ef => 53
	i32 748832960, ; 21: SQLitePCLRaw.batteries_v2 => 0x2ca248c0 => 46
	i32 800472933, ; 22: SQLiteNetExtensionsAsync => 0x2fb63f65 => 45
	i32 809851609, ; 23: System.Drawing.Common.dll => 0x30455ad9 => 0
	i32 864956750, ; 24: Syncfusion.SfMaskedEdit.XForms => 0x338e314e => 56
	i32 902159924, ; 25: Rg.Plugins.Popup => 0x35c5de34 => 41
	i32 928116545, ; 26: Xamarin.Google.Guava.ListenableFuture => 0x3751ef41 => 67
	i32 955402788, ; 27: Newtonsoft.Json => 0x38f24a24 => 36
	i32 957807352, ; 28: Plugin.CurrentActivity => 0x3916faf8 => 39
	i32 967690846, ; 29: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 24
	i32 974778368, ; 30: FormsViewGroup.dll => 0x3a19f000 => 35
	i32 1012816738, ; 31: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 61
	i32 1035644815, ; 32: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 15
	i32 1042160112, ; 33: Xamarin.Forms.Platform.dll => 0x3e1e19f0 => 65
	i32 1052210849, ; 34: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 26
	i32 1071854640, ; 35: AppPallet => 0x3fe33430 => 69
	i32 1098259244, ; 36: System => 0x41761b2c => 9
	i32 1104002344, ; 37: Plugin.Media => 0x41cdbd28 => 40
	i32 1292207520, ; 38: SQLitePCLRaw.core.dll => 0x4d0585a0 => 47
	i32 1293217323, ; 39: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 21
	i32 1365406463, ; 40: System.ServiceModel.Internals.dll => 0x516272ff => 32
	i32 1376866003, ; 41: Xamarin.AndroidX.SavedState => 0x52114ed3 => 61
	i32 1388842911, ; 42: PCLExt.FileStorage.Abstractions.dll => 0x52c80f9f => 37
	i32 1406073936, ; 43: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 18
	i32 1406198180, ; 44: AppPallet.Android => 0x53d0e1a4 => 68
	i32 1411638395, ; 45: System.Runtime.CompilerServices.Unsafe => 0x5423e47b => 11
	i32 1460219004, ; 46: Xamarin.Forms.Xaml => 0x57092c7c => 66
	i32 1469204771, ; 47: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 14
	i32 1516315406, ; 48: Syncfusion.Core.XForms.Android.dll => 0x5a61230e => 52
	i32 1592978981, ; 49: System.Runtime.Serialization.dll => 0x5ef2ee25 => 3
	i32 1604451928, ; 50: SQLiteNetExtensions => 0x5fa1fe58 => 44
	i32 1622152042, ; 51: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 27
	i32 1639515021, ; 52: System.Net.Http.dll => 0x61b9038d => 2
	i32 1658251792, ; 53: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 31
	i32 1666713512, ; 54: SQLiteNetExtensions.dll => 0x635807a8 => 44
	i32 1711441057, ; 55: SQLitePCLRaw.lib.e_sqlite3.android => 0x660284a1 => 48
	i32 1729485958, ; 56: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 17
	i32 1766324549, ; 57: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 29
	i32 1776026572, ; 58: System.Core.dll => 0x69dc03cc => 8
	i32 1788241197, ; 59: Xamarin.AndroidX.Fragment => 0x6a96652d => 22
	i32 1808609942, ; 60: Xamarin.AndroidX.Loader => 0x6bcd3296 => 27
	i32 1813201214, ; 61: Xamarin.Google.Android.Material => 0x6c13413e => 31
	i32 1841309220, ; 62: AppPallet.Android.dll => 0x6dc02624 => 68
	i32 1867746548, ; 63: Xamarin.Essentials.dll => 0x6f538cf4 => 62
	i32 1878053835, ; 64: Xamarin.Forms.Xaml.dll => 0x6ff0d3cb => 66
	i32 1936121326, ; 65: Syncfusion.SfPicker.XForms.dll => 0x7366ddee => 59
	i32 2011961780, ; 66: System.Buffers.dll => 0x77ec19b4 => 7
	i32 2019465201, ; 67: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 26
	i32 2048185678, ; 68: Plugin.Media.dll => 0x7a14d54e => 40
	i32 2055257422, ; 69: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 25
	i32 2071563619, ; 70: Syncfusion.Buttons.XForms.Android => 0x7b798d63 => 50
	i32 2097448633, ; 71: Xamarin.AndroidX.Legacy.Support.Core.UI => 0x7d0486b9 => 23
	i32 2103459038, ; 72: SQLitePCLRaw.provider.e_sqlite3.dll => 0x7d603cde => 49
	i32 2126786730, ; 73: Xamarin.Forms.Platform.Android => 0x7ec430aa => 64
	i32 2192674484, ; 74: Syncfusion.SfMaskedEdit.XForms.dll => 0x82b18eb4 => 56
	i32 2201231467, ; 75: System.Net.Http => 0x8334206b => 2
	i32 2272153315, ; 76: Syncfusion.SfPicker.Android.dll => 0x876e4ee3 => 57
	i32 2279755925, ; 77: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 28
	i32 2343171156, ; 78: Syncfusion.Core.XForms => 0x8ba9f454 => 53
	i32 2354730003, ; 79: Syncfusion.Licensing => 0x8c5a5413 => 54
	i32 2465273461, ; 80: SQLitePCLRaw.batteries_v2.dll => 0x92f11675 => 46
	i32 2475788418, ; 81: Java.Interop.dll => 0x93918882 => 4
	i32 2635300604, ; 82: Syncfusion.Buttons.XForms => 0x9d137efc => 51
	i32 2732626843, ; 83: Xamarin.AndroidX.Activity => 0xa2e0939b => 60
	i32 2737747696, ; 84: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 14
	i32 2766581644, ; 85: Xamarin.Forms.Core => 0xa4e6af8c => 63
	i32 2778768386, ; 86: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 30
	i32 2784016111, ; 87: Syncfusion.SfPicker.XForms => 0xa5f0b6ef => 59
	i32 2806986428, ; 88: Plugin.CurrentActivity.dll => 0xa74f36bc => 39
	i32 2810250172, ; 89: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 18
	i32 2819470561, ; 90: System.Xml.dll => 0xa80db4e1 => 12
	i32 2853208004, ; 91: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 30
	i32 2861816565, ; 92: Rg.Plugins.Popup.dll => 0xaa93daf5 => 41
	i32 2868557005, ; 93: Syncfusion.Licensing.dll => 0xaafab4cd => 54
	i32 2874148507, ; 94: Syncfusion.Core.XForms.Android => 0xab50069b => 52
	i32 2905242038, ; 95: mscorlib.dll => 0xad2a79b6 => 6
	i32 2947987946, ; 96: FluentFTP.dll => 0xafb6b9ea => 34
	i32 2950047143, ; 97: PCLExt.FileStorage.dll => 0xafd625a7 => 38
	i32 2978675010, ; 98: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 21
	i32 2979101390, ; 99: FluentFTP => 0xb1917ace => 34
	i32 3017678341, ; 100: Syncfusion.SfMaskedEdit.XForms.Android => 0xb3de1e05 => 55
	i32 3044182254, ; 101: FormsViewGroup => 0xb57288ee => 35
	i32 3111772706, ; 102: System.Runtime.Serialization => 0xb979e222 => 3
	i32 3204380047, ; 103: System.Data.dll => 0xbefef58f => 1
	i32 3247949154, ; 104: Mono.Security => 0xc197c562 => 33
	i32 3258312781, ; 105: Xamarin.AndroidX.CardView => 0xc235e84d => 17
	i32 3270722617, ; 106: Syncfusion.SfPicker.Android => 0xc2f34439 => 57
	i32 3286872994, ; 107: SQLite-net.dll => 0xc3e9b3a2 => 43
	i32 3317135071, ; 108: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 20
	i32 3317144872, ; 109: System.Data => 0xc5b79d28 => 1
	i32 3340387945, ; 110: SkiaSharp => 0xc71a4669 => 42
	i32 3353484488, ; 111: Xamarin.AndroidX.Legacy.Support.Core.UI.dll => 0xc7e21cc8 => 23
	i32 3360279109, ; 112: SQLitePCLRaw.core => 0xc849ca45 => 47
	i32 3362522851, ; 113: Xamarin.AndroidX.Core => 0xc86c06e3 => 19
	i32 3366347497, ; 114: Java.Interop => 0xc8a662e9 => 4
	i32 3374999561, ; 115: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 28
	i32 3395150330, ; 116: System.Runtime.CompilerServices.Unsafe.dll => 0xca5de1fa => 11
	i32 3404865022, ; 117: System.ServiceModel.Internals => 0xcaf21dfe => 32
	i32 3429136800, ; 118: System.Xml => 0xcc6479a0 => 12
	i32 3434749838, ; 119: Syncfusion.Buttons.XForms.Android.dll => 0xccba1f8e => 50
	i32 3476120550, ; 120: Mono.Android => 0xcf3163e6 => 5
	i32 3509114376, ; 121: System.Xml.Linq => 0xd128d608 => 13
	i32 3536029504, ; 122: Xamarin.Forms.Platform.Android.dll => 0xd2c38740 => 64
	i32 3632359727, ; 123: Xamarin.Forms.Platform => 0xd881692f => 65
	i32 3641597786, ; 124: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 25
	i32 3672681054, ; 125: Mono.Android.dll => 0xdae8aa5e => 5
	i32 3682565725, ; 126: Xamarin.AndroidX.Browser => 0xdb7f7e5d => 16
	i32 3689375977, ; 127: System.Drawing.Common => 0xdbe768e9 => 0
	i32 3695434377, ; 128: AppPallet.dll => 0xdc43da89 => 69
	i32 3754567612, ; 129: SQLitePCLRaw.provider.e_sqlite3 => 0xdfca27bc => 49
	i32 3829621856, ; 130: System.Numerics.dll => 0xe4436460 => 10
	i32 3876362041, ; 131: SQLite-net => 0xe70c9739 => 43
	i32 3896760992, ; 132: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 19
	i32 3949143839, ; 133: Syncfusion.SfPicker.XForms.Android.dll => 0xeb63271f => 58
	i32 3955647286, ; 134: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 15
	i32 4087494849, ; 135: SQLiteNetExtensionsAsync.dll => 0xf3a238c1 => 45
	i32 4105002889, ; 136: Mono.Security.dll => 0xf4ad5f89 => 33
	i32 4151237749, ; 137: System.Core => 0xf76edc75 => 8
	i32 4232084532, ; 138: PCLExt.FileStorage.Abstractions => 0xfc407c34 => 37
	i32 4260525087 ; 139: System.Buffers => 0xfdf2741f => 7
], align 4
@assembly_image_cache_indices = local_unnamed_addr constant [140 x i32] [
	i32 67, i32 36, i32 63, i32 55, i32 51, i32 29, i32 38, i32 16, ; 0..7
	i32 60, i32 10, i32 24, i32 48, i32 62, i32 22, i32 6, i32 9, ; 8..15
	i32 42, i32 58, i32 20, i32 13, i32 53, i32 46, i32 45, i32 0, ; 16..23
	i32 56, i32 41, i32 67, i32 36, i32 39, i32 24, i32 35, i32 61, ; 24..31
	i32 15, i32 65, i32 26, i32 69, i32 9, i32 40, i32 47, i32 21, ; 32..39
	i32 32, i32 61, i32 37, i32 18, i32 68, i32 11, i32 66, i32 14, ; 40..47
	i32 52, i32 3, i32 44, i32 27, i32 2, i32 31, i32 44, i32 48, ; 48..55
	i32 17, i32 29, i32 8, i32 22, i32 27, i32 31, i32 68, i32 62, ; 56..63
	i32 66, i32 59, i32 7, i32 26, i32 40, i32 25, i32 50, i32 23, ; 64..71
	i32 49, i32 64, i32 56, i32 2, i32 57, i32 28, i32 53, i32 54, ; 72..79
	i32 46, i32 4, i32 51, i32 60, i32 14, i32 63, i32 30, i32 59, ; 80..87
	i32 39, i32 18, i32 12, i32 30, i32 41, i32 54, i32 52, i32 6, ; 88..95
	i32 34, i32 38, i32 21, i32 34, i32 55, i32 35, i32 3, i32 1, ; 96..103
	i32 33, i32 17, i32 57, i32 43, i32 20, i32 1, i32 42, i32 23, ; 104..111
	i32 47, i32 19, i32 4, i32 28, i32 11, i32 32, i32 12, i32 50, ; 112..119
	i32 5, i32 13, i32 64, i32 65, i32 25, i32 5, i32 16, i32 0, ; 120..127
	i32 69, i32 49, i32 10, i32 43, i32 19, i32 58, i32 15, i32 45, ; 128..135
	i32 33, i32 8, i32 37, i32 7 ; 136..139
], align 4

@marshal_methods_number_of_classes = local_unnamed_addr constant i32 0, align 4

; marshal_methods_class_cache
@marshal_methods_class_cache = global [0 x %struct.MarshalMethodsManagedClass] [
], align 4; end of 'marshal_methods_class_cache' array


@get_function_pointer = internal unnamed_addr global void (i32, i32, i32, i8**)* null, align 4

; Function attributes: "frame-pointer"="none" "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind sspstrong "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" uwtable willreturn writeonly
define void @xamarin_app_init (void (i32, i32, i32, i8**)* %fn) local_unnamed_addr #0
{
	store void (i32, i32, i32, i8**)* %fn, void (i32, i32, i32, i8**)** @get_function_pointer, align 4
	ret void
}

; Names of classes in which marshal methods reside
@mm_class_names = local_unnamed_addr constant [0 x i8*] zeroinitializer, align 4
@__MarshalMethodName_name.0 = internal constant [1 x i8] c"\00", align 1

; mm_method_names
@mm_method_names = local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	; 0
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		i8* getelementptr inbounds ([1 x i8], [1 x i8]* @__MarshalMethodName_name.0, i32 0, i32 0); name
	}
], align 8; end of 'mm_method_names' array


attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind sspstrong "stack-protector-buffer-size"="8" uwtable willreturn writeonly "frame-pointer"="none" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" "stackrealign" }
attributes #1 = { "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" nounwind sspstrong "stack-protector-buffer-size"="8" uwtable "frame-pointer"="none" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" "stackrealign" }
attributes #2 = { nounwind }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 1, !"NumRegisterParameters", i32 0}
!3 = !{!"Xamarin.Android remotes/origin/d17-5 @ 45b0e144f73b2c8747d8b5ec8cbd3b55beca67f0"}
!llvm.linker.options = !{}
