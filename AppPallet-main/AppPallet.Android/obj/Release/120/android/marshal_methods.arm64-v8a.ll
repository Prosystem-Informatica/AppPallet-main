; ModuleID = 'obj\Release\120\android\marshal_methods.arm64-v8a.ll'
source_filename = "obj\Release\120\android\marshal_methods.arm64-v8a.ll"
target datalayout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
target triple = "aarch64-unknown-linux-android"


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
@assembly_image_cache = local_unnamed_addr global [0 x %struct.MonoImage*] zeroinitializer, align 8
; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = local_unnamed_addr constant [140 x i64] [
	i64 30579257353033782, ; 0: Syncfusion.Buttons.XForms => 0x6ca3ac2c05d836 => 51
	i64 120698629574877762, ; 1: Mono.Android => 0x1accec39cafe242 => 5
	i64 232391251801502327, ; 2: Xamarin.AndroidX.SavedState.dll => 0x3399e9cbc897277 => 61
	i64 263803244706540312, ; 3: Rg.Plugins.Popup.dll => 0x3a937a743542b18 => 41
	i64 702024105029695270, ; 4: System.Drawing.Common => 0x9be17343c0e7726 => 0
	i64 720058930071658100, ; 5: Xamarin.AndroidX.Legacy.Support.Core.UI => 0x9fe29c82844de74 => 23
	i64 870603111519317375, ; 6: SQLitePCLRaw.lib.e_sqlite3.android => 0xc1500ead2756d7f => 48
	i64 872800313462103108, ; 7: Xamarin.AndroidX.DrawerLayout => 0xc1ccf42c3c21c44 => 21
	i64 996343623809489702, ; 8: Xamarin.Forms.Platform => 0xdd3b93f3b63db26 => 65
	i64 1000557547492888992, ; 9: Mono.Security.dll => 0xde2b1c9cba651a0 => 33
	i64 1120440138749646132, ; 10: Xamarin.Google.Android.Material.dll => 0xf8c9a5eae431534 => 31
	i64 1301485588176585670, ; 11: SQLitePCLRaw.core => 0x120fce3f338e43c6 => 47
	i64 1425944114962822056, ; 12: System.Runtime.Serialization.dll => 0x13c9f89e19eaf3a8 => 3
	i64 1518315023656898250, ; 13: SQLitePCLRaw.provider.e_sqlite3 => 0x151223783a354eca => 49
	i64 1624659445732251991, ; 14: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0x168bf32877da9957 => 14
	i64 1731380447121279447, ; 15: Newtonsoft.Json => 0x18071957e9b889d7 => 36
	i64 1795316252682057001, ; 16: Xamarin.AndroidX.AppCompat.dll => 0x18ea3e9eac997529 => 15
	i64 1836611346387731153, ; 17: Xamarin.AndroidX.SavedState => 0x197cf449ebe482d1 => 61
	i64 1981742497975770890, ; 18: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x1b80904d5c241f0a => 26
	i64 2076847052340733488, ; 19: Syncfusion.Core.XForms => 0x1cd27163f7962630 => 53
	i64 2133195048986300728, ; 20: Newtonsoft.Json.dll => 0x1d9aa1984b735138 => 36
	i64 2165725771938924357, ; 21: Xamarin.AndroidX.Browser => 0x1e0e341d75540745 => 16
	i64 2262844636196693701, ; 22: Xamarin.AndroidX.DrawerLayout.dll => 0x1f673d352266e6c5 => 21
	i64 2329709569556905518, ; 23: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x2054ca829b447e2e => 25
	i64 2337758774805907496, ; 24: System.Runtime.CompilerServices.Unsafe => 0x207163383edbc828 => 11
	i64 2469392061734276978, ; 25: Syncfusion.Core.XForms.Android.dll => 0x22450aff2ad74f72 => 52
	i64 2470498323731680442, ; 26: Xamarin.AndroidX.CoordinatorLayout => 0x2248f922dc398cba => 18
	i64 2547086958574651984, ; 27: Xamarin.AndroidX.Activity.dll => 0x2359121801df4a50 => 60
	i64 2592350477072141967, ; 28: System.Xml.dll => 0x23f9e10627330e8f => 12
	i64 2624866290265602282, ; 29: mscorlib.dll => 0x246d65fbde2db8ea => 6
	i64 2762480568376986107, ; 30: PCLExt.FileStorage.Abstractions => 0x26564d70d10789fb => 37
	i64 2783046991838674048, ; 31: System.Runtime.CompilerServices.Unsafe.dll => 0x269f5e7e6dc37c80 => 11
	i64 2801558180824670388, ; 32: Plugin.CurrentActivity.dll => 0x26e1225279a4e0b4 => 39
	i64 2960931600190307745, ; 33: Xamarin.Forms.Core => 0x2917579a49927da1 => 63
	i64 3017704767998173186, ; 34: Xamarin.Google.Android.Material => 0x29e10a7f7d88a002 => 31
	i64 3289520064315143713, ; 35: Xamarin.AndroidX.Lifecycle.Common => 0x2da6b911e3063621 => 24
	i64 3522470458906976663, ; 36: Xamarin.AndroidX.SwipeRefreshLayout => 0x30e2543832f52197 => 29
	i64 3531994851595924923, ; 37: System.Numerics => 0x31042a9aade235bb => 10
	i64 3609787854626478660, ; 38: Plugin.CurrentActivity => 0x32188aeda587da44 => 39
	i64 3727469159507183293, ; 39: Xamarin.AndroidX.RecyclerView => 0x33baa1739ba646bd => 28
	i64 3943415582112705276, ; 40: Syncfusion.Buttons.XForms.dll => 0x36b9d3942d916afc => 51
	i64 4308357023624807347, ; 41: FluentFTP => 0x3bca5be2e6b743b3 => 34
	i64 4337444564132831293, ; 42: SQLitePCLRaw.batteries_v2.dll => 0x3c31b2d9ae16203d => 46
	i64 4525561845656915374, ; 43: System.ServiceModel.Internals => 0x3ece06856b710dae => 32
	i64 4794310189461587505, ; 44: Xamarin.AndroidX.Activity => 0x4288cfb749e4c631 => 60
	i64 4795410492532947900, ; 45: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0x428cb86f8f9b7bbc => 29
	i64 4906396365959678531, ; 46: Syncfusion.SfPicker.XForms => 0x4417057fe84b4a43 => 59
	i64 5142919913060024034, ; 47: Xamarin.Forms.Platform.Android.dll => 0x475f52699e39bee2 => 64
	i64 5202753749449073649, ; 48: Plugin.Media => 0x4833e4f841be63f1 => 40
	i64 5203618020066742981, ; 49: Xamarin.Essentials => 0x4836f704f0e652c5 => 62
	i64 5507995362134886206, ; 50: System.Core.dll => 0x4c705499688c873e => 8
	i64 5848635860608528381, ; 51: Syncfusion.SfPicker.Android => 0x512a8753ec2eaffd => 57
	i64 6085203216496545422, ; 52: Xamarin.Forms.Platform.dll => 0x5472fc15a9574e8e => 65
	i64 6086316965293125504, ; 53: FormsViewGroup.dll => 0x5476f10882baef80 => 35
	i64 6183170893902868313, ; 54: SQLitePCLRaw.batteries_v2 => 0x55cf092b0c9d6f59 => 46
	i64 6252756117335416132, ; 55: SQLiteNetExtensionsAsync.dll => 0x56c6408f68ed9d44 => 45
	i64 6401687960814735282, ; 56: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0x58d75d486341cfb2 => 25
	i64 6504860066809920875, ; 57: Xamarin.AndroidX.Browser.dll => 0x5a45e7c43bd43d6b => 16
	i64 6548213210057960872, ; 58: Xamarin.AndroidX.CustomView.dll => 0x5adfed387b066da8 => 20
	i64 6659513131007730089, ; 59: Xamarin.AndroidX.Legacy.Support.Core.UI.dll => 0x5c6b57e8b6c3e1a9 => 23
	i64 6671798237668743565, ; 60: SkiaSharp => 0x5c96fd260152998d => 42
	i64 6876862101832370452, ; 61: System.Xml.Linq => 0x5f6f85a57d108914 => 13
	i64 6999232271162345813, ; 62: SQLiteNetExtensions => 0x612244aac7150955 => 44
	i64 7026608356547306326, ; 63: Syncfusion.Core.XForms.dll => 0x618387125bcb2356 => 53
	i64 7052597884222137255, ; 64: AppPallet.Android.dll => 0x61dfdc68d0bb63a7 => 68
	i64 7488575175965059935, ; 65: System.Xml.Linq.dll => 0x67ecc3724534ab5f => 13
	i64 7547171332664898270, ; 66: SQLiteNetExtensions.dll => 0x68bcf0572680b2de => 44
	i64 7635363394907363464, ; 67: Xamarin.Forms.Core.dll => 0x69f6428dc4795888 => 63
	i64 7637365915383206639, ; 68: Xamarin.Essentials.dll => 0x69fd5fd5e61792ef => 62
	i64 7654504624184590948, ; 69: System.Net.Http => 0x6a3a4366801b8264 => 2
	i64 7699019951333995876, ; 70: PCLExt.FileStorage => 0x6ad869dac5e87564 => 38
	i64 7767211987177345230, ; 71: Syncfusion.SfPicker.Android.dll => 0x6bcaae265edc90ce => 57
	i64 7820441508502274321, ; 72: System.Data => 0x6c87ca1e14ff8111 => 1
	i64 7836164640616011524, ; 73: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x6cbfa6390d64d704 => 14
	i64 8083354569033831015, ; 74: Xamarin.AndroidX.Lifecycle.Common.dll => 0x702dd82730cad267 => 24
	i64 8167236081217502503, ; 75: Java.Interop.dll => 0x7157d9f1a9b8fd27 => 4
	i64 8517710342570482946, ; 76: Syncfusion.Buttons.XForms.Android => 0x7634fc6d84959d02 => 50
	i64 8626175481042262068, ; 77: Java.Interop => 0x77b654e585b55834 => 4
	i64 9324707631942237306, ; 78: Xamarin.AndroidX.AppCompat => 0x8168042fd44a7c7a => 15
	i64 9653670174411988578, ; 79: Syncfusion.SfPicker.XForms.Android => 0x85f8b9e0549c1e62 => 58
	i64 9662334977499516867, ; 80: System.Numerics.dll => 0x8617827802b0cfc3 => 10
	i64 9678050649315576968, ; 81: Xamarin.AndroidX.CoordinatorLayout.dll => 0x864f57c9feb18c88 => 18
	i64 9808709177481450983, ; 82: Mono.Android.dll => 0x881f890734e555e7 => 5
	i64 9998632235833408227, ; 83: Mono.Security => 0x8ac2470b209ebae3 => 33
	i64 10038780035334861115, ; 84: System.Net.Http.dll => 0x8b50e941206af13b => 2
	i64 10229024438826829339, ; 85: Xamarin.AndroidX.CustomView => 0x8df4cb880b10061b => 20
	i64 10430153318873392755, ; 86: Xamarin.AndroidX.Core => 0x90bf592ea44f6673 => 19
	i64 10856784884601556644, ; 87: PCLExt.FileStorage.dll => 0x96ab0c54b1818ea4 => 38
	i64 11023048688141570732, ; 88: System.Core => 0x98f9bc61168392ac => 8
	i64 11037814507248023548, ; 89: System.Xml => 0x992e31d0412bf7fc => 12
	i64 11162124722117608902, ; 90: Xamarin.AndroidX.ViewPager => 0x9ae7d54b986d05c6 => 30
	i64 11529969570048099689, ; 91: Xamarin.AndroidX.ViewPager.dll => 0xa002ae3c4dc7c569 => 30
	i64 11606334278361545453, ; 92: Syncfusion.SfMaskedEdit.XForms.Android => 0xa111fb887e2dfaed => 55
	i64 11739066727115742305, ; 93: SQLite-net.dll => 0xa2e98afdf8575c61 => 43
	i64 11806260347154423189, ; 94: SQLite-net => 0xa3d8433bc5eb5d95 => 43
	i64 12015315196412107586, ; 95: AppPallet.Android => 0xa6bef982e27f1b42 => 68
	i64 12102847907131387746, ; 96: System.Buffers => 0xa7f5f40c43256f62 => 7
	i64 12271526709721397701, ; 97: Syncfusion.SfPicker.XForms.dll => 0xaa4d388670a979c5 => 59
	i64 12279246230491828964, ; 98: SQLitePCLRaw.provider.e_sqlite3.dll => 0xaa68a5636e0512e4 => 49
	i64 12312508881223092658, ; 99: Syncfusion.SfMaskedEdit.XForms.Android.dll => 0xaaded197cf2509b2 => 55
	i64 12451044538927396471, ; 100: Xamarin.AndroidX.Fragment.dll => 0xaccaff0a2955b677 => 22
	i64 12466513435562512481, ; 101: Xamarin.AndroidX.Loader.dll => 0xad01f3eb52569061 => 27
	i64 12538491095302438457, ; 102: Xamarin.AndroidX.CardView.dll => 0xae01ab382ae67e39 => 17
	i64 12722888224888195414, ; 103: AppPallet.dll => 0xb090c76e89760956 => 69
	i64 12963446364377008305, ; 104: System.Drawing.Common.dll => 0xb3e769c8fd8548b1 => 0
	i64 13370592475155966277, ; 105: System.Runtime.Serialization => 0xb98de304062ea945 => 3
	i64 13391361154981494717, ; 106: Syncfusion.Buttons.XForms.Android.dll => 0xb9d7ac051da2ffbd => 50
	i64 13454009404024712428, ; 107: Xamarin.Google.Guava.ListenableFuture => 0xbab63e4543a86cec => 67
	i64 13572454107664307259, ; 108: Xamarin.AndroidX.RecyclerView.dll => 0xbc5b0b19d99f543b => 28
	i64 13622732128915678507, ; 109: Syncfusion.Core.XForms.Android => 0xbd0daab1e651e52b => 52
	i64 13643785327914841093, ; 110: Plugin.Media.dll => 0xbd587677c60cf405 => 40
	i64 13647894001087880694, ; 111: System.Data.dll => 0xbd670f48cb071df6 => 1
	i64 13802825973146328710, ; 112: SQLiteNetExtensionsAsync => 0xbf8d7d1791ec1e86 => 45
	i64 13902543935539791585, ; 113: Syncfusion.SfMaskedEdit.XForms => 0xc0efc20cf01c46e1 => 56
	i64 13959074834287824816, ; 114: Xamarin.AndroidX.Fragment => 0xc1b8989a7ad20fb0 => 22
	i64 13967638549803255703, ; 115: Xamarin.Forms.Platform.Android => 0xc1d70541e0134797 => 64
	i64 13970307180132182141, ; 116: Syncfusion.Licensing => 0xc1e0805ccade287d => 54
	i64 14124974489674258913, ; 117: Xamarin.AndroidX.CardView => 0xc405fd76067d19e1 => 17
	i64 14538127318538747197, ; 118: Syncfusion.Licensing.dll => 0xc9c1cdc518e77d3d => 54
	i64 14792063746108907174, ; 119: Xamarin.Google.Guava.ListenableFuture.dll => 0xcd47f79af9c15ea6 => 67
	i64 15241747024500257992, ; 120: Syncfusion.SfMaskedEdit.XForms.dll => 0xd385902a1fb474c8 => 56
	i64 15370334346939861994, ; 121: Xamarin.AndroidX.Core.dll => 0xd54e65a72c560bea => 19
	i64 15609085926864131306, ; 122: System.dll => 0xd89e9cf3334914ea => 9
	i64 15810740023422282496, ; 123: Xamarin.Forms.Xaml => 0xdb6b08484c22eb00 => 66
	i64 16154507427712707110, ; 124: System => 0xe03056ea4e39aa26 => 9
	i64 16324796876805858114, ; 125: SkiaSharp.dll => 0xe28d5444586b6342 => 42
	i64 16427145038571576407, ; 126: FluentFTP.dll => 0xe3f8f160b9e11c57 => 34
	i64 16755018182064898362, ; 127: SQLitePCLRaw.core.dll => 0xe885c843c330813a => 47
	i64 16787552971463248837, ; 128: Syncfusion.SfPicker.XForms.Android.dll => 0xe8f95e7bb81ecbc5 => 58
	i64 16833383113903931215, ; 129: mscorlib => 0xe99c30c1484d7f4f => 6
	i64 17285063141349522879, ; 130: Rg.Plugins.Popup => 0xefe0e158cc55fdbf => 41
	i64 17704177640604968747, ; 131: Xamarin.AndroidX.Loader => 0xf5b1dfc36cac272b => 27
	i64 17710060891934109755, ; 132: Xamarin.AndroidX.Lifecycle.ViewModel => 0xf5c6c68c9e45303b => 26
	i64 17838668724098252521, ; 133: System.Buffers.dll => 0xf78faeb0f5bf3ee9 => 7
	i64 17882897186074144999, ; 134: FormsViewGroup => 0xf82cd03e3ac830e7 => 35
	i64 17892495832318972303, ; 135: Xamarin.Forms.Xaml.dll => 0xf84eea293687918f => 66
	i64 18025737336454566659, ; 136: AppPallet => 0xfa28489a61ded303 => 69
	i64 18129453464017766560, ; 137: System.ServiceModel.Internals.dll => 0xfb98c1df1ec108a0 => 32
	i64 18370042311372477656, ; 138: SQLitePCLRaw.lib.e_sqlite3.android.dll => 0xfeef80274e4094d8 => 48
	i64 18432980509352721481 ; 139: PCLExt.FileStorage.Abstractions.dll => 0xffcf1a1c73aafc49 => 37
], align 8
@assembly_image_cache_indices = local_unnamed_addr constant [140 x i32] [
	i32 51, i32 5, i32 61, i32 41, i32 0, i32 23, i32 48, i32 21, ; 0..7
	i32 65, i32 33, i32 31, i32 47, i32 3, i32 49, i32 14, i32 36, ; 8..15
	i32 15, i32 61, i32 26, i32 53, i32 36, i32 16, i32 21, i32 25, ; 16..23
	i32 11, i32 52, i32 18, i32 60, i32 12, i32 6, i32 37, i32 11, ; 24..31
	i32 39, i32 63, i32 31, i32 24, i32 29, i32 10, i32 39, i32 28, ; 32..39
	i32 51, i32 34, i32 46, i32 32, i32 60, i32 29, i32 59, i32 64, ; 40..47
	i32 40, i32 62, i32 8, i32 57, i32 65, i32 35, i32 46, i32 45, ; 48..55
	i32 25, i32 16, i32 20, i32 23, i32 42, i32 13, i32 44, i32 53, ; 56..63
	i32 68, i32 13, i32 44, i32 63, i32 62, i32 2, i32 38, i32 57, ; 64..71
	i32 1, i32 14, i32 24, i32 4, i32 50, i32 4, i32 15, i32 58, ; 72..79
	i32 10, i32 18, i32 5, i32 33, i32 2, i32 20, i32 19, i32 38, ; 80..87
	i32 8, i32 12, i32 30, i32 30, i32 55, i32 43, i32 43, i32 68, ; 88..95
	i32 7, i32 59, i32 49, i32 55, i32 22, i32 27, i32 17, i32 69, ; 96..103
	i32 0, i32 3, i32 50, i32 67, i32 28, i32 52, i32 40, i32 1, ; 104..111
	i32 45, i32 56, i32 22, i32 64, i32 54, i32 17, i32 54, i32 67, ; 112..119
	i32 56, i32 19, i32 9, i32 66, i32 9, i32 42, i32 34, i32 47, ; 120..127
	i32 58, i32 6, i32 41, i32 27, i32 26, i32 7, i32 35, i32 66, ; 128..135
	i32 69, i32 32, i32 48, i32 37 ; 136..139
], align 4

@marshal_methods_number_of_classes = local_unnamed_addr constant i32 0, align 4

; marshal_methods_class_cache
@marshal_methods_class_cache = global [0 x %struct.MarshalMethodsManagedClass] [
], align 8; end of 'marshal_methods_class_cache' array


@get_function_pointer = internal unnamed_addr global void (i32, i32, i32, i8**)* null, align 8

; Function attributes: "frame-pointer"="non-leaf" "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind sspstrong "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+neon,+outline-atomics" uwtable willreturn writeonly
define void @xamarin_app_init (void (i32, i32, i32, i8**)* %fn) local_unnamed_addr #0
{
	store void (i32, i32, i32, i8**)* %fn, void (i32, i32, i32, i8**)** @get_function_pointer, align 8
	ret void
}

; Names of classes in which marshal methods reside
@mm_class_names = local_unnamed_addr constant [0 x i8*] zeroinitializer, align 8
@__MarshalMethodName_name.0 = internal constant [1 x i8] c"\00", align 1

; mm_method_names
@mm_method_names = local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	; 0
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		i8* getelementptr inbounds ([1 x i8], [1 x i8]* @__MarshalMethodName_name.0, i32 0, i32 0); name
	}
], align 8; end of 'mm_method_names' array


attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind sspstrong "stack-protector-buffer-size"="8" uwtable willreturn writeonly "frame-pointer"="non-leaf" "target-cpu"="generic" "target-features"="+neon,+outline-atomics" }
attributes #1 = { "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" nounwind sspstrong "stack-protector-buffer-size"="8" uwtable "frame-pointer"="non-leaf" "target-cpu"="generic" "target-features"="+neon,+outline-atomics" }
attributes #2 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4, !5}
!llvm.ident = !{!6}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 1, !"branch-target-enforcement", i32 0}
!3 = !{i32 1, !"sign-return-address", i32 0}
!4 = !{i32 1, !"sign-return-address-all", i32 0}
!5 = !{i32 1, !"sign-return-address-with-bkey", i32 0}
!6 = !{!"Xamarin.Android remotes/origin/d17-5 @ 45b0e144f73b2c8747d8b5ec8cbd3b55beca67f0"}
!llvm.linker.options = !{}
