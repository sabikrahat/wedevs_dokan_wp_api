import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'src/app.dart' show App;
import 'src/config/get.platform.dart';
import 'src/db/isar.dart';
import 'src/utils/themes/themes.dart';

void main() async {
  await _init();
  runApp(const ProviderScope(child: App()));
  SystemChrome.setSystemUIOverlayStyle(uiConfig);
}

Future<void> _init() async {
  pt = PlatformInfo.getCurrentPlatformType();
  await openDB();
  _configLoading();
  await initAppDatum();
}

void _configLoading() {
  EasyLoading.instance
    ..dismissOnTap = false
    ..userInteractions = false
    ..maskType = EasyLoadingMaskType.black
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle;
}


