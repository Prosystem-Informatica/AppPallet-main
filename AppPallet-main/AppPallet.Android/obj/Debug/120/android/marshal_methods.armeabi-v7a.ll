; ModuleID = 'obj\Debug\120\android\marshal_methods.armeabi-v7a.ll'
source_filename = "obj\Debug\120\android\marshal_methods.armeabi-v7a.ll"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "armv7-unknown-linux-android"


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
@assembly_image_cache_hashes = local_unnamed_addr constant [316 x i32] [
	i32 32687329, ; 0: Xamarin.AndroidX.Lifecycle.Runtime => 0x1f2c4e1 => 111
	i32 34715100, ; 1: Xamarin.Google.Guava.ListenableFuture.dll => 0x211b5dc => 140
	i32 39109920, ; 2: Newtonsoft.Json.dll => 0x254c520 => 14
	i32 57263871, ; 3: Xamarin.Forms.Core.dll => 0x369c6ff => 135
	i32 57967248, ; 4: Xamarin.Android.Support.VersionedParcelable.dll => 0x3748290 => 80
	i32 66706743, ; 5: Syncfusion.SfMaskedEdit.XForms.Android.dll => 0x3f9dd37 => 33
	i32 99762151, ; 6: Syncfusion.Buttons.XForms.dll => 0x5f23fe7 => 29
	i32 101534019, ; 7: Xamarin.AndroidX.SlidingPaneLayout => 0x60d4943 => 125
	i32 120558881, ; 8: Xamarin.AndroidX.SlidingPaneLayout.dll => 0x72f9521 => 125
	i32 160529393, ; 9: Xamarin.Android.Arch.Core.Common => 0x9917bf1 => 48
	i32 165246403, ; 10: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 92
	i32 166922606, ; 11: Xamarin.Android.Support.Compat.dll => 0x9f3096e => 59
	i32 182336117, ; 12: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 126
	i32 201930040, ; 13: Xamarin.Android.Arch.Core.Runtime => 0xc093538 => 49
	i32 202702780, ; 14: PCLExt.FileStorage => 0xc14ffbc => 16
	i32 209399409, ; 15: Xamarin.AndroidX.Browser.dll => 0xc7b2e71 => 90
	i32 220171995, ; 16: System.Diagnostics.Debug => 0xd1f8edb => 150
	i32 230216969, ; 17: Xamarin.AndroidX.Legacy.Support.Core.Utils.dll => 0xdb8d509 => 106
	i32 232815796, ; 18: System.Web.Services => 0xde07cb4 => 146
	i32 261689757, ; 19: Xamarin.AndroidX.ConstraintLayout.dll => 0xf99119d => 95
	i32 278686392, ; 20: Xamarin.AndroidX.Lifecycle.LiveData.dll => 0x109c6ab8 => 110
	i32 280482487, ; 21: Xamarin.AndroidX.Interpolator => 0x10b7d2b7 => 104
	i32 293914992, ; 22: Xamarin.Android.Support.Transition => 0x1184c970 => 75
	i32 318968648, ; 23: Xamarin.AndroidX.Activity.dll => 0x13031348 => 82
	i32 321597661, ; 24: System.Numerics => 0x132b30dd => 42
	i32 342366114, ; 25: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 108
	i32 347068432, ; 26: SQLitePCLRaw.lib.e_sqlite3.android.dll => 0x14afd810 => 26
	i32 385762202, ; 27: System.Memory.dll => 0x16fe439a => 41
	i32 388313361, ; 28: Xamarin.Android.Support.Animated.Vector.Drawable => 0x17253111 => 55
	i32 389971796, ; 29: Xamarin.Android.Support.Core.UI => 0x173e7f54 => 61
	i32 441335492, ; 30: Xamarin.AndroidX.ConstraintLayout.Core => 0x1a4e3ec4 => 94
	i32 442521989, ; 31: Xamarin.Essentials => 0x1a605985 => 134
	i32 442565967, ; 32: System.Collections => 0x1a61054f => 151
	i32 450948140, ; 33: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 103
	i32 465846621, ; 34: mscorlib => 0x1bc4415d => 13
	i32 469710990, ; 35: System.dll => 0x1bff388e => 40
	i32 476646585, ; 36: Xamarin.AndroidX.Interpolator.dll => 0x1c690cb9 => 104
	i32 486930444, ; 37: Xamarin.AndroidX.LocalBroadcastManager.dll => 0x1d05f80c => 115
	i32 498788369, ; 38: System.ObjectModel => 0x1dbae811 => 155
	i32 514659665, ; 39: Xamarin.Android.Support.Compat => 0x1ead1551 => 59
	i32 524864063, ; 40: Xamarin.Android.Support.Print => 0x1f48ca3f => 72
	i32 525008092, ; 41: SkiaSharp.dll => 0x1f4afcdc => 20
	i32 526420162, ; 42: System.Transactions.dll => 0x1f6088c2 => 145
	i32 539750087, ; 43: Xamarin.Android.Support.Design => 0x202beec7 => 65
	i32 545304856, ; 44: System.Runtime.Extensions => 0x2080b118 => 156
	i32 555173402, ; 45: Syncfusion.SfPicker.XForms.Android => 0x2117461a => 36
	i32 571524804, ; 46: Xamarin.Android.Support.v7.RecyclerView => 0x2210c6c4 => 78
	i32 605376203, ; 47: System.IO.Compression.FileSystem => 0x24154ecb => 143
	i32 627609679, ; 48: Xamarin.AndroidX.CustomView => 0x2568904f => 99
	i32 663517072, ; 49: Xamarin.AndroidX.VersionedParcelable => 0x278c7790 => 131
	i32 666292255, ; 50: Xamarin.AndroidX.Arch.Core.Common.dll => 0x27b6d01f => 87
	i32 690569205, ; 51: System.Xml.Linq.dll => 0x29293ff5 => 47
	i32 692692150, ; 52: Xamarin.Android.Support.Annotations => 0x2949a4b6 => 56
	i32 719061231, ; 53: Syncfusion.Core.XForms.dll => 0x2adc00ef => 31
	i32 748832960, ; 54: SQLitePCLRaw.batteries_v2 => 0x2ca248c0 => 24
	i32 775507847, ; 55: System.IO.Compression => 0x2e394f87 => 142
	i32 800472933, ; 56: SQLiteNetExtensionsAsync => 0x2fb63f65 => 23
	i32 801787702, ; 57: Xamarin.Android.Support.Interpolator => 0x2fca4f36 => 69
	i32 809851609, ; 58: System.Drawing.Common.dll => 0x30455ad9 => 4
	i32 843511501, ; 59: Xamarin.AndroidX.Print => 0x3246f6cd => 122
	i32 864956750, ; 60: Syncfusion.SfMaskedEdit.XForms => 0x338e314e => 34
	i32 902159924, ; 61: Rg.Plugins.Popup => 0x35c5de34 => 19
	i32 916714535, ; 62: Xamarin.Android.Support.Print.dll => 0x36a3f427 => 72
	i32 928116545, ; 63: Xamarin.Google.Guava.ListenableFuture => 0x3751ef41 => 140
	i32 955402788, ; 64: Newtonsoft.Json => 0x38f24a24 => 14
	i32 957807352, ; 65: Plugin.CurrentActivity => 0x3916faf8 => 17
	i32 967690846, ; 66: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 108
	i32 974778368, ; 67: FormsViewGroup.dll => 0x3a19f000 => 10
	i32 987342438, ; 68: Xamarin.Android.Arch.Lifecycle.LiveData.dll => 0x3ad9a666 => 52
	i32 992768348, ; 69: System.Collections.dll => 0x3b2c715c => 151
	i32 1012816738, ; 70: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 124
	i32 1035644815, ; 71: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 86
	i32 1042160112, ; 72: Xamarin.Forms.Platform.dll => 0x3e1e19f0 => 137
	i32 1044663988, ; 73: System.Linq.Expressions.dll => 0x3e444eb4 => 152
	i32 1052210849, ; 74: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 112
	i32 1071854640, ; 75: AppPallet => 0x3fe33430 => 8
	i32 1098167829, ; 76: Xamarin.Android.Arch.Lifecycle.ViewModel => 0x4174b615 => 54
	i32 1098259244, ; 77: System => 0x41761b2c => 40
	i32 1104002344, ; 78: Plugin.Media => 0x41cdbd28 => 18
	i32 1175144683, ; 79: Xamarin.AndroidX.VectorDrawable.Animated => 0x460b48eb => 129
	i32 1178241025, ; 80: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 119
	i32 1204270330, ; 81: Xamarin.AndroidX.Arch.Core.Common => 0x47c7b4fa => 87
	i32 1267360935, ; 82: Xamarin.AndroidX.VectorDrawable => 0x4b8a64a7 => 130
	i32 1292207520, ; 83: SQLitePCLRaw.core.dll => 0x4d0585a0 => 25
	i32 1292763917, ; 84: Xamarin.Android.Support.CursorAdapter.dll => 0x4d0e030d => 63
	i32 1293217323, ; 85: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 101
	i32 1297413738, ; 86: Xamarin.Android.Arch.Lifecycle.LiveData.Core => 0x4d54f66a => 51
	i32 1324164729, ; 87: System.Linq => 0x4eed2679 => 154
	i32 1359785034, ; 88: Xamarin.Android.Support.Design.dll => 0x510cac4a => 65
	i32 1364015309, ; 89: System.IO => 0x514d38cd => 148
	i32 1365406463, ; 90: System.ServiceModel.Internals.dll => 0x516272ff => 147
	i32 1376866003, ; 91: Xamarin.AndroidX.SavedState => 0x52114ed3 => 124
	i32 1379779777, ; 92: System.Resources.ResourceManager => 0x523dc4c1 => 2
	i32 1388842911, ; 93: PCLExt.FileStorage.Abstractions.dll => 0x52c80f9f => 15
	i32 1395857551, ; 94: Xamarin.AndroidX.Media.dll => 0x5333188f => 116
	i32 1406073936, ; 95: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 96
	i32 1406198180, ; 96: AppPallet.Android => 0x53d0e1a4 => 0
	i32 1411638395, ; 97: System.Runtime.CompilerServices.Unsafe => 0x5423e47b => 44
	i32 1445445088, ; 98: Xamarin.Android.Support.Fragment => 0x5627bde0 => 68
	i32 1457743152, ; 99: System.Runtime.Extensions.dll => 0x56e36530 => 156
	i32 1460219004, ; 100: Xamarin.Forms.Xaml => 0x57092c7c => 138
	i32 1462112819, ; 101: System.IO.Compression.dll => 0x57261233 => 142
	i32 1469204771, ; 102: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 85
	i32 1516315406, ; 103: Syncfusion.Core.XForms.Android.dll => 0x5a61230e => 30
	i32 1550322496, ; 104: System.Reflection.Extensions.dll => 0x5c680b40 => 3
	i32 1574652163, ; 105: Xamarin.Android.Support.Core.Utils.dll => 0x5ddb4903 => 62
	i32 1582372066, ; 106: Xamarin.AndroidX.DocumentFile.dll => 0x5e5114e2 => 100
	i32 1587447679, ; 107: Xamarin.Android.Arch.Core.Common.dll => 0x5e9e877f => 48
	i32 1592978981, ; 108: System.Runtime.Serialization.dll => 0x5ef2ee25 => 7
	i32 1604451928, ; 109: SQLiteNetExtensions => 0x5fa1fe58 => 22
	i32 1622152042, ; 110: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 114
	i32 1624863272, ; 111: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 133
	i32 1636350590, ; 112: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 98
	i32 1639515021, ; 113: System.Net.Http.dll => 0x61b9038d => 6
	i32 1657153582, ; 114: System.Runtime => 0x62c6282e => 45
	i32 1658241508, ; 115: Xamarin.AndroidX.Tracing.Tracing.dll => 0x62d6c1e4 => 127
	i32 1658251792, ; 116: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 139
	i32 1662014763, ; 117: Xamarin.Android.Support.Vector.Drawable => 0x6310552b => 79
	i32 1666713512, ; 118: SQLiteNetExtensions.dll => 0x635807a8 => 22
	i32 1670060433, ; 119: Xamarin.AndroidX.ConstraintLayout => 0x638b1991 => 95
	i32 1701541528, ; 120: System.Diagnostics.Debug.dll => 0x656b7698 => 150
	i32 1711441057, ; 121: SQLitePCLRaw.lib.e_sqlite3.android => 0x660284a1 => 26
	i32 1726116996, ; 122: System.Reflection.dll => 0x66e27484 => 153
	i32 1729485958, ; 123: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 91
	i32 1765942094, ; 124: System.Reflection.Extensions => 0x6942234e => 3
	i32 1766324549, ; 125: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 126
	i32 1776026572, ; 126: System.Core.dll => 0x69dc03cc => 39
	i32 1788241197, ; 127: Xamarin.AndroidX.Fragment => 0x6a96652d => 103
	i32 1808609942, ; 128: Xamarin.AndroidX.Loader => 0x6bcd3296 => 114
	i32 1813201214, ; 129: Xamarin.Google.Android.Material => 0x6c13413e => 139
	i32 1818569960, ; 130: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 120
	i32 1841309220, ; 131: AppPallet.Android.dll => 0x6dc02624 => 0
	i32 1858542181, ; 132: System.Linq.Expressions => 0x6ec71a65 => 152
	i32 1866717392, ; 133: Xamarin.Android.Support.Interpolator.dll => 0x6f43d8d0 => 69
	i32 1867746548, ; 134: Xamarin.Essentials.dll => 0x6f538cf4 => 134
	i32 1877418711, ; 135: Xamarin.Android.Support.v7.RecyclerView.dll => 0x6fe722d7 => 78
	i32 1878053835, ; 136: Xamarin.Forms.Xaml.dll => 0x6ff0d3cb => 138
	i32 1885316902, ; 137: Xamarin.AndroidX.Arch.Core.Runtime.dll => 0x705fa726 => 88
	i32 1900610850, ; 138: System.Resources.ResourceManager.dll => 0x71490522 => 2
	i32 1916660109, ; 139: Xamarin.Android.Arch.Lifecycle.ViewModel.dll => 0x723de98d => 54
	i32 1919157823, ; 140: Xamarin.AndroidX.MultiDex.dll => 0x7264063f => 117
	i32 1936121326, ; 141: Syncfusion.SfPicker.XForms.dll => 0x7366ddee => 37
	i32 2011961780, ; 142: System.Buffers.dll => 0x77ec19b4 => 38
	i32 2019465201, ; 143: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 112
	i32 2037417872, ; 144: Xamarin.Android.Support.ViewPager => 0x79708790 => 81
	i32 2044222327, ; 145: Xamarin.Android.Support.Loader => 0x79d85b77 => 70
	i32 2048185678, ; 146: Plugin.Media.dll => 0x7a14d54e => 18
	i32 2055257422, ; 147: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 109
	i32 2071563619, ; 148: Syncfusion.Buttons.XForms.Android => 0x7b798d63 => 28
	i32 2079903147, ; 149: System.Runtime.dll => 0x7bf8cdab => 45
	i32 2090596640, ; 150: System.Numerics.Vectors => 0x7c9bf920 => 43
	i32 2097448633, ; 151: Xamarin.AndroidX.Legacy.Support.Core.UI => 0x7d0486b9 => 105
	i32 2103459038, ; 152: SQLitePCLRaw.provider.e_sqlite3.dll => 0x7d603cde => 27
	i32 2126786730, ; 153: Xamarin.Forms.Platform.Android => 0x7ec430aa => 136
	i32 2139458754, ; 154: Xamarin.Android.Support.DrawerLayout => 0x7f858cc2 => 67
	i32 2166116741, ; 155: Xamarin.Android.Support.Core.Utils => 0x811c5185 => 62
	i32 2192674484, ; 156: Syncfusion.SfMaskedEdit.XForms.dll => 0x82b18eb4 => 34
	i32 2193016926, ; 157: System.ObjectModel.dll => 0x82b6c85e => 155
	i32 2196165013, ; 158: Xamarin.Android.Support.VersionedParcelable => 0x82e6d195 => 80
	i32 2201231467, ; 159: System.Net.Http => 0x8334206b => 6
	i32 2217644978, ; 160: Xamarin.AndroidX.VectorDrawable.Animated.dll => 0x842e93b2 => 129
	i32 2244775296, ; 161: Xamarin.AndroidX.LocalBroadcastManager => 0x85cc8d80 => 115
	i32 2256548716, ; 162: Xamarin.AndroidX.MultiDex => 0x8680336c => 117
	i32 2261435625, ; 163: Xamarin.AndroidX.Legacy.Support.V4.dll => 0x86cac4e9 => 107
	i32 2272153315, ; 164: Syncfusion.SfPicker.Android.dll => 0x876e4ee3 => 35
	i32 2279755925, ; 165: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 123
	i32 2315684594, ; 166: Xamarin.AndroidX.Annotation.dll => 0x8a068af2 => 83
	i32 2330457430, ; 167: Xamarin.Android.Support.Core.UI.dll => 0x8ae7f556 => 61
	i32 2330986192, ; 168: Xamarin.Android.Support.SlidingPaneLayout.dll => 0x8af006d0 => 73
	i32 2343171156, ; 169: Syncfusion.Core.XForms => 0x8ba9f454 => 31
	i32 2354730003, ; 170: Syncfusion.Licensing => 0x8c5a5413 => 32
	i32 2373288475, ; 171: Xamarin.Android.Support.Fragment.dll => 0x8d75821b => 68
	i32 2409053734, ; 172: Xamarin.AndroidX.Preference.dll => 0x8f973e26 => 121
	i32 2440966767, ; 173: Xamarin.Android.Support.Loader.dll => 0x917e326f => 70
	i32 2465273461, ; 174: SQLitePCLRaw.batteries_v2.dll => 0x92f11675 => 24
	i32 2465532216, ; 175: Xamarin.AndroidX.ConstraintLayout.Core.dll => 0x92f50938 => 94
	i32 2471841756, ; 176: netstandard.dll => 0x93554fdc => 1
	i32 2475788418, ; 177: Java.Interop.dll => 0x93918882 => 11
	i32 2487632829, ; 178: Xamarin.Android.Support.DocumentFile => 0x944643bd => 66
	i32 2501346920, ; 179: System.Data.DataSetExtensions => 0x95178668 => 141
	i32 2505896520, ; 180: Xamarin.AndroidX.Lifecycle.Runtime.dll => 0x955cf248 => 111
	i32 2581819634, ; 181: Xamarin.AndroidX.VectorDrawable.dll => 0x99e370f2 => 130
	i32 2620871830, ; 182: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 98
	i32 2624644809, ; 183: Xamarin.AndroidX.DynamicAnimation => 0x9c70e6c9 => 102
	i32 2633051222, ; 184: Xamarin.AndroidX.Lifecycle.LiveData => 0x9cf12c56 => 110
	i32 2635300604, ; 185: Syncfusion.Buttons.XForms => 0x9d137efc => 29
	i32 2693849962, ; 186: System.IO.dll => 0xa090e36a => 148
	i32 2698266930, ; 187: Xamarin.Android.Arch.Lifecycle.LiveData => 0xa0d44932 => 52
	i32 2701096212, ; 188: Xamarin.AndroidX.Tracing.Tracing => 0xa0ff7514 => 127
	i32 2715334215, ; 189: System.Threading.Tasks.dll => 0xa1d8b647 => 149
	i32 2732626843, ; 190: Xamarin.AndroidX.Activity => 0xa2e0939b => 82
	i32 2737747696, ; 191: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 85
	i32 2751899777, ; 192: Xamarin.Android.Support.Collections => 0xa406a881 => 58
	i32 2766581644, ; 193: Xamarin.Forms.Core => 0xa4e6af8c => 135
	i32 2778768386, ; 194: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 132
	i32 2784016111, ; 195: Syncfusion.SfPicker.XForms => 0xa5f0b6ef => 37
	i32 2788639665, ; 196: Xamarin.Android.Support.LocalBroadcastManager => 0xa63743b1 => 71
	i32 2788775637, ; 197: Xamarin.Android.Support.SwipeRefreshLayout.dll => 0xa63956d5 => 74
	i32 2806986428, ; 198: Plugin.CurrentActivity.dll => 0xa74f36bc => 17
	i32 2810250172, ; 199: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 96
	i32 2819470561, ; 200: System.Xml.dll => 0xa80db4e1 => 46
	i32 2853208004, ; 201: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 132
	i32 2855708567, ; 202: Xamarin.AndroidX.Transition => 0xaa36a797 => 128
	i32 2861816565, ; 203: Rg.Plugins.Popup.dll => 0xaa93daf5 => 19
	i32 2868557005, ; 204: Syncfusion.Licensing.dll => 0xaafab4cd => 32
	i32 2874148507, ; 205: Syncfusion.Core.XForms.Android => 0xab50069b => 30
	i32 2876493027, ; 206: Xamarin.Android.Support.SwipeRefreshLayout => 0xab73cce3 => 74
	i32 2893257763, ; 207: Xamarin.Android.Arch.Core.Runtime.dll => 0xac739c23 => 49
	i32 2901442782, ; 208: System.Reflection => 0xacf080de => 153
	i32 2903344695, ; 209: System.ComponentModel.Composition => 0xad0d8637 => 144
	i32 2905242038, ; 210: mscorlib.dll => 0xad2a79b6 => 13
	i32 2916838712, ; 211: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 133
	i32 2919462931, ; 212: System.Numerics.Vectors.dll => 0xae037813 => 43
	i32 2921128767, ; 213: Xamarin.AndroidX.Annotation.Experimental.dll => 0xae1ce33f => 84
	i32 2921692953, ; 214: Xamarin.Android.Support.CustomView.dll => 0xae257f19 => 64
	i32 2922925221, ; 215: Xamarin.Android.Support.Vector.Drawable.dll => 0xae384ca5 => 79
	i32 2947987946, ; 216: FluentFTP.dll => 0xafb6b9ea => 9
	i32 2950047143, ; 217: PCLExt.FileStorage.dll => 0xafd625a7 => 16
	i32 2978675010, ; 218: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 101
	i32 2979101390, ; 219: FluentFTP => 0xb1917ace => 9
	i32 3017678341, ; 220: Syncfusion.SfMaskedEdit.XForms.Android => 0xb3de1e05 => 33
	i32 3024354802, ; 221: Xamarin.AndroidX.Legacy.Support.Core.Utils => 0xb443fdf2 => 106
	i32 3044182254, ; 222: FormsViewGroup => 0xb57288ee => 10
	i32 3056250942, ; 223: Xamarin.Android.Support.AsyncLayoutInflater.dll => 0xb62ab03e => 57
	i32 3057625584, ; 224: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 118
	i32 3068715062, ; 225: Xamarin.Android.Arch.Lifecycle.Common => 0xb6e8e036 => 50
	i32 3075834255, ; 226: System.Threading.Tasks => 0xb755818f => 149
	i32 3111772706, ; 227: System.Runtime.Serialization => 0xb979e222 => 7
	i32 3204380047, ; 228: System.Data.dll => 0xbefef58f => 5
	i32 3204912593, ; 229: Xamarin.Android.Support.AsyncLayoutInflater => 0xbf0715d1 => 57
	i32 3211777861, ; 230: Xamarin.AndroidX.DocumentFile => 0xbf6fd745 => 100
	i32 3233339011, ; 231: Xamarin.Android.Arch.Lifecycle.LiveData.Core.dll => 0xc0b8d683 => 51
	i32 3247949154, ; 232: Mono.Security => 0xc197c562 => 157
	i32 3258312781, ; 233: Xamarin.AndroidX.CardView => 0xc235e84d => 91
	i32 3267021929, ; 234: Xamarin.AndroidX.AsyncLayoutInflater => 0xc2bacc69 => 89
	i32 3270722617, ; 235: Syncfusion.SfPicker.Android => 0xc2f34439 => 35
	i32 3286872994, ; 236: SQLite-net.dll => 0xc3e9b3a2 => 21
	i32 3296380511, ; 237: Xamarin.Android.Support.Collections.dll => 0xc47ac65f => 58
	i32 3317135071, ; 238: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 99
	i32 3317144872, ; 239: System.Data => 0xc5b79d28 => 5
	i32 3321585405, ; 240: Xamarin.Android.Support.DocumentFile.dll => 0xc5fb5efd => 66
	i32 3340387945, ; 241: SkiaSharp => 0xc71a4669 => 20
	i32 3340431453, ; 242: Xamarin.AndroidX.Arch.Core.Runtime => 0xc71af05d => 88
	i32 3346324047, ; 243: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 119
	i32 3352662376, ; 244: Xamarin.Android.Support.CoordinaterLayout => 0xc7d59168 => 60
	i32 3353484488, ; 245: Xamarin.AndroidX.Legacy.Support.Core.UI.dll => 0xc7e21cc8 => 105
	i32 3357663996, ; 246: Xamarin.Android.Support.CursorAdapter => 0xc821e2fc => 63
	i32 3360279109, ; 247: SQLitePCLRaw.core => 0xc849ca45 => 25
	i32 3362522851, ; 248: Xamarin.AndroidX.Core => 0xc86c06e3 => 97
	i32 3366347497, ; 249: Java.Interop => 0xc8a662e9 => 11
	i32 3374999561, ; 250: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 123
	i32 3395150330, ; 251: System.Runtime.CompilerServices.Unsafe.dll => 0xca5de1fa => 44
	i32 3404865022, ; 252: System.ServiceModel.Internals => 0xcaf21dfe => 147
	i32 3429136800, ; 253: System.Xml => 0xcc6479a0 => 46
	i32 3430777524, ; 254: netstandard => 0xcc7d82b4 => 1
	i32 3434749838, ; 255: Syncfusion.Buttons.XForms.Android.dll => 0xccba1f8e => 28
	i32 3439690031, ; 256: Xamarin.Android.Support.Annotations.dll => 0xcd05812f => 56
	i32 3441283291, ; 257: Xamarin.AndroidX.DynamicAnimation.dll => 0xcd1dd0db => 102
	i32 3476120550, ; 258: Mono.Android => 0xcf3163e6 => 12
	i32 3486566296, ; 259: System.Transactions => 0xcfd0c798 => 145
	i32 3493954962, ; 260: Xamarin.AndroidX.Concurrent.Futures.dll => 0xd0418592 => 93
	i32 3498942916, ; 261: Xamarin.Android.Support.v7.CardView.dll => 0xd08da1c4 => 77
	i32 3501239056, ; 262: Xamarin.AndroidX.AsyncLayoutInflater.dll => 0xd0b0ab10 => 89
	i32 3509114376, ; 263: System.Xml.Linq => 0xd128d608 => 47
	i32 3536029504, ; 264: Xamarin.Forms.Platform.Android.dll => 0xd2c38740 => 136
	i32 3547625832, ; 265: Xamarin.Android.Support.SlidingPaneLayout => 0xd3747968 => 73
	i32 3567349600, ; 266: System.ComponentModel.Composition.dll => 0xd4a16f60 => 144
	i32 3608519521, ; 267: System.Linq.dll => 0xd715a361 => 154
	i32 3618140916, ; 268: Xamarin.AndroidX.Preference => 0xd7a872f4 => 121
	i32 3627220390, ; 269: Xamarin.AndroidX.Print.dll => 0xd832fda6 => 122
	i32 3632359727, ; 270: Xamarin.Forms.Platform => 0xd881692f => 137
	i32 3633644679, ; 271: Xamarin.AndroidX.Annotation.Experimental => 0xd8950487 => 84
	i32 3641597786, ; 272: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 109
	i32 3664423555, ; 273: Xamarin.Android.Support.ViewPager.dll => 0xda6aaa83 => 81
	i32 3672681054, ; 274: Mono.Android.dll => 0xdae8aa5e => 12
	i32 3676310014, ; 275: System.Web.Services.dll => 0xdb2009fe => 146
	i32 3678221644, ; 276: Xamarin.Android.Support.v7.AppCompat => 0xdb3d354c => 76
	i32 3681174138, ; 277: Xamarin.Android.Arch.Lifecycle.Common.dll => 0xdb6a427a => 50
	i32 3682565725, ; 278: Xamarin.AndroidX.Browser => 0xdb7f7e5d => 90
	i32 3684561358, ; 279: Xamarin.AndroidX.Concurrent.Futures => 0xdb9df1ce => 93
	i32 3689375977, ; 280: System.Drawing.Common => 0xdbe768e9 => 4
	i32 3695434377, ; 281: AppPallet.dll => 0xdc43da89 => 8
	i32 3714038699, ; 282: Xamarin.Android.Support.LocalBroadcastManager.dll => 0xdd5fbbab => 71
	i32 3718463572, ; 283: Xamarin.Android.Support.Animated.Vector.Drawable.dll => 0xdda34054 => 55
	i32 3718780102, ; 284: Xamarin.AndroidX.Annotation => 0xdda814c6 => 83
	i32 3724971120, ; 285: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 118
	i32 3754567612, ; 286: SQLitePCLRaw.provider.e_sqlite3 => 0xdfca27bc => 27
	i32 3758932259, ; 287: Xamarin.AndroidX.Legacy.Support.V4 => 0xe00cc123 => 107
	i32 3776062606, ; 288: Xamarin.Android.Support.DrawerLayout.dll => 0xe112248e => 67
	i32 3786282454, ; 289: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 92
	i32 3822602673, ; 290: Xamarin.AndroidX.Media => 0xe3d849b1 => 116
	i32 3829621856, ; 291: System.Numerics.dll => 0xe4436460 => 42
	i32 3832731800, ; 292: Xamarin.Android.Support.CoordinaterLayout.dll => 0xe472d898 => 60
	i32 3862817207, ; 293: Xamarin.Android.Arch.Lifecycle.Runtime.dll => 0xe63de9b7 => 53
	i32 3874897629, ; 294: Xamarin.Android.Arch.Lifecycle.Runtime => 0xe6f63edd => 53
	i32 3876362041, ; 295: SQLite-net => 0xe70c9739 => 21
	i32 3883175360, ; 296: Xamarin.Android.Support.v7.AppCompat.dll => 0xe7748dc0 => 76
	i32 3885922214, ; 297: Xamarin.AndroidX.Transition.dll => 0xe79e77a6 => 128
	i32 3896760992, ; 298: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 97
	i32 3920810846, ; 299: System.IO.Compression.FileSystem.dll => 0xe9b2d35e => 143
	i32 3921031405, ; 300: Xamarin.AndroidX.VersionedParcelable.dll => 0xe9b630ed => 131
	i32 3931092270, ; 301: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 120
	i32 3945713374, ; 302: System.Data.DataSetExtensions.dll => 0xeb2ecede => 141
	i32 3949143839, ; 303: Syncfusion.SfPicker.XForms.Android.dll => 0xeb63271f => 36
	i32 3955647286, ; 304: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 86
	i32 4025784931, ; 305: System.Memory => 0xeff49a63 => 41
	i32 4063435586, ; 306: Xamarin.Android.Support.CustomView => 0xf2331b42 => 64
	i32 4087494849, ; 307: SQLiteNetExtensionsAsync.dll => 0xf3a238c1 => 23
	i32 4105002889, ; 308: Mono.Security.dll => 0xf4ad5f89 => 157
	i32 4151237749, ; 309: System.Core => 0xf76edc75 => 39
	i32 4182413190, ; 310: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 113
	i32 4216993138, ; 311: Xamarin.Android.Support.Transition.dll => 0xfb5a3572 => 75
	i32 4219003402, ; 312: Xamarin.Android.Support.v7.CardView => 0xfb78e20a => 77
	i32 4232084532, ; 313: PCLExt.FileStorage.Abstractions => 0xfc407c34 => 15
	i32 4260525087, ; 314: System.Buffers => 0xfdf2741f => 38
	i32 4292120959 ; 315: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 113
], align 4
@assembly_image_cache_indices = local_unnamed_addr constant [316 x i32] [
	i32 111, i32 140, i32 14, i32 135, i32 80, i32 33, i32 29, i32 125, ; 0..7
	i32 125, i32 48, i32 92, i32 59, i32 126, i32 49, i32 16, i32 90, ; 8..15
	i32 150, i32 106, i32 146, i32 95, i32 110, i32 104, i32 75, i32 82, ; 16..23
	i32 42, i32 108, i32 26, i32 41, i32 55, i32 61, i32 94, i32 134, ; 24..31
	i32 151, i32 103, i32 13, i32 40, i32 104, i32 115, i32 155, i32 59, ; 32..39
	i32 72, i32 20, i32 145, i32 65, i32 156, i32 36, i32 78, i32 143, ; 40..47
	i32 99, i32 131, i32 87, i32 47, i32 56, i32 31, i32 24, i32 142, ; 48..55
	i32 23, i32 69, i32 4, i32 122, i32 34, i32 19, i32 72, i32 140, ; 56..63
	i32 14, i32 17, i32 108, i32 10, i32 52, i32 151, i32 124, i32 86, ; 64..71
	i32 137, i32 152, i32 112, i32 8, i32 54, i32 40, i32 18, i32 129, ; 72..79
	i32 119, i32 87, i32 130, i32 25, i32 63, i32 101, i32 51, i32 154, ; 80..87
	i32 65, i32 148, i32 147, i32 124, i32 2, i32 15, i32 116, i32 96, ; 88..95
	i32 0, i32 44, i32 68, i32 156, i32 138, i32 142, i32 85, i32 30, ; 96..103
	i32 3, i32 62, i32 100, i32 48, i32 7, i32 22, i32 114, i32 133, ; 104..111
	i32 98, i32 6, i32 45, i32 127, i32 139, i32 79, i32 22, i32 95, ; 112..119
	i32 150, i32 26, i32 153, i32 91, i32 3, i32 126, i32 39, i32 103, ; 120..127
	i32 114, i32 139, i32 120, i32 0, i32 152, i32 69, i32 134, i32 78, ; 128..135
	i32 138, i32 88, i32 2, i32 54, i32 117, i32 37, i32 38, i32 112, ; 136..143
	i32 81, i32 70, i32 18, i32 109, i32 28, i32 45, i32 43, i32 105, ; 144..151
	i32 27, i32 136, i32 67, i32 62, i32 34, i32 155, i32 80, i32 6, ; 152..159
	i32 129, i32 115, i32 117, i32 107, i32 35, i32 123, i32 83, i32 61, ; 160..167
	i32 73, i32 31, i32 32, i32 68, i32 121, i32 70, i32 24, i32 94, ; 168..175
	i32 1, i32 11, i32 66, i32 141, i32 111, i32 130, i32 98, i32 102, ; 176..183
	i32 110, i32 29, i32 148, i32 52, i32 127, i32 149, i32 82, i32 85, ; 184..191
	i32 58, i32 135, i32 132, i32 37, i32 71, i32 74, i32 17, i32 96, ; 192..199
	i32 46, i32 132, i32 128, i32 19, i32 32, i32 30, i32 74, i32 49, ; 200..207
	i32 153, i32 144, i32 13, i32 133, i32 43, i32 84, i32 64, i32 79, ; 208..215
	i32 9, i32 16, i32 101, i32 9, i32 33, i32 106, i32 10, i32 57, ; 216..223
	i32 118, i32 50, i32 149, i32 7, i32 5, i32 57, i32 100, i32 51, ; 224..231
	i32 157, i32 91, i32 89, i32 35, i32 21, i32 58, i32 99, i32 5, ; 232..239
	i32 66, i32 20, i32 88, i32 119, i32 60, i32 105, i32 63, i32 25, ; 240..247
	i32 97, i32 11, i32 123, i32 44, i32 147, i32 46, i32 1, i32 28, ; 248..255
	i32 56, i32 102, i32 12, i32 145, i32 93, i32 77, i32 89, i32 47, ; 256..263
	i32 136, i32 73, i32 144, i32 154, i32 121, i32 122, i32 137, i32 84, ; 264..271
	i32 109, i32 81, i32 12, i32 146, i32 76, i32 50, i32 90, i32 93, ; 272..279
	i32 4, i32 8, i32 71, i32 55, i32 83, i32 118, i32 27, i32 107, ; 280..287
	i32 67, i32 92, i32 116, i32 42, i32 60, i32 53, i32 53, i32 21, ; 288..295
	i32 76, i32 128, i32 97, i32 143, i32 131, i32 120, i32 141, i32 36, ; 296..303
	i32 86, i32 41, i32 64, i32 23, i32 157, i32 39, i32 113, i32 75, ; 304..311
	i32 77, i32 15, i32 38, i32 113 ; 312..315
], align 4

@marshal_methods_number_of_classes = local_unnamed_addr constant i32 0, align 4

; marshal_methods_class_cache
@marshal_methods_class_cache = global [0 x %struct.MarshalMethodsManagedClass] [
], align 4; end of 'marshal_methods_class_cache' array


@get_function_pointer = internal unnamed_addr global void (i32, i32, i32, i8**)* null, align 4

; Function attributes: "frame-pointer"="all" "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind sspstrong "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+thumb-mode,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-aes,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-sha2,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" uwtable willreturn writeonly
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


attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind sspstrong "stack-protector-buffer-size"="8" uwtable willreturn writeonly "frame-pointer"="all" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+thumb-mode,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-aes,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-sha2,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" }
attributes #1 = { "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" nounwind sspstrong "stack-protector-buffer-size"="8" uwtable "frame-pointer"="all" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+thumb-mode,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-aes,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-sha2,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" }
attributes #2 = { nounwind }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 1, !"min_enum_size", i32 4}
!3 = !{!"Xamarin.Android remotes/origin/d17-5 @ 45b0e144f73b2c8747d8b5ec8cbd3b55beca67f0"}
!llvm.linker.options = !{}
