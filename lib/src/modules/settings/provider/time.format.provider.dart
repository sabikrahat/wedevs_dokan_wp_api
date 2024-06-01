import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/settings.model.dart';
import 'settings.provider.dart';

const timeFormates = [
  'hh:mm a',
  'hh:mm:ss a',
  'hh:mm',
  'hh:mm:ss',
  'HH:mm',
  'HH:mm:ss',
];

typedef TimeFormatNotifier = NotifierProvider<TimeFormatProvider, String>;

final timeFormatProvider = TimeFormatNotifier(TimeFormatProvider.new);

class TimeFormatProvider extends Notifier<String> {
  @override
  String build() => ref.watch(settingsProvider.select((v) => v.timeFormat));

  Future<void> changeTimeFormat(String timeFormat) async {
    // await compute(_changeTimeFormat, _Data(ref.read(settingsProvider), timeFormat));
    await ref.read(settingsProvider).copyWith(timeFormat: timeFormat).save();
  }
}

// void _changeTimeFormat(_Data data) {
//   openDBSync(data.dir);
//   data.setting.timeFormat = data.timeFormat;
//   data.setting.saveSync();
// }

// class _Data {
//   _Data(this.setting, this.timeFormat);

//   final AppDir dir = appDir;
//   final String timeFormat;
//   final AppSettings setting;
// }
