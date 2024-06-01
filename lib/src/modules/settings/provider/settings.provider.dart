import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../db/isar.dart';
import '../../../utils/logger/logger_helper.dart';
import '../model/settings.model.dart';

final _settingsStream = db.appSettings.watchObject(0, fireImmediately: true);

final settingsStreamProvider = StreamProvider((_) => _settingsStream);

typedef AppSettingsNotifier = NotifierProvider<SettingProvider, AppSettings>;

final settingsProvider = AppSettingsNotifier(SettingProvider.new);

class SettingProvider extends Notifier<AppSettings> {
  @override
  AppSettings build() =>
      ref.watch(settingsStreamProvider).value ?? AppSettings();

  Future<bool> changeInitSetting(AppSettings setting) async {
    log.i('First Time Run. Initializing...');
    // await compute(_changeInit, _Data(setting));
    await setting.save();
    state = setting;
    return true;
  }
}

// void _changeInit(_Data data) {
//   openDBSync(data.dir);
//   data.setting.saveSync();
// }

// class _Data {
//   _Data(this.setting);

//   final AppDir dir = appDir;
//   final AppSettings setting;
// }
