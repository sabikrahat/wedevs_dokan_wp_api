import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fast_cached_network_image/fast_cached_network_image.dart';

import 'src/app.dart' show App;
import 'src/config/get.platform.dart';
import 'src/db/isar.dart';
import 'src/db/paths.dart';
import 'src/utils/themes/themes.dart';

void main() async {
  await _init();
  runApp(const ProviderScope(child: App()));
  SystemChrome.setSystemUIOverlayStyle(uiConfig);
}

Future<void> _init() async {
  pt = PlatformInfo.getCurrentPlatformType();
  await openDB();
  await _initFastCachedImageConfig();
  _configLoading();
  await initAppDatum();
}

Future<void> _initFastCachedImageConfig() async {
  await FastCachedImageConfig.init(
    subDir: pt.isWeb ? '' : appDir.files.path,
    clearCacheAfter: const Duration(days: 30),
  );
}


void _configLoading() {
  EasyLoading.instance
    ..dismissOnTap = false
    ..userInteractions = false
    ..maskType = EasyLoadingMaskType.black
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle;
}


