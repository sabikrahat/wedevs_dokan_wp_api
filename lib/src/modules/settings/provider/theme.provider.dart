import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/settings.model.dart';
import '../model/theme/theme.model.dart';
import 'settings.provider.dart';

typedef ThemeNotifier = NotifierProvider<ThemeProvider, ThemeProfile>;

final themeProvider = ThemeNotifier(ThemeProvider.new);

class ThemeProvider extends Notifier<ThemeProfile> {
  @override
  ThemeProfile build() => ref.watch(settingsProvider.select((v) => v.theme));

  ThemeProfile get theme => state;

  Future<void> changeTheme() async {
    // await compute(_changeTheme, _Data(ref.read(settingsProvider), theme.toggled));
    await ref.read(settingsProvider).copyWith(theme: theme.toggled).save();
  }
}

// void _changeTheme(_Data data) {
//   openDBSync(data.dir);
//   data.setting.theme = data.theme;
//   data.setting.saveSync();
// }

// class _Data {
//   _Data(this.setting, this.theme);

//   final AppDir dir = appDir;
//   final ThemeProfile theme;
//   final AppSettings setting;
// }
