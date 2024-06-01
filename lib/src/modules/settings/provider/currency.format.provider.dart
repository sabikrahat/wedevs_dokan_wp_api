import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/settings.model.dart';
import 'settings.provider.dart';

const currencyFormates = [
  {
    'name': 'in Cores',
    'format': '#,##,##0.00#',
  },
  {
    'name': 'in Billions',
    'format': '#,##0.00',
  },
];

typedef CurrencyFormatNotifier
    = NotifierProvider<CurrencyFormatProvider, String>;

final currencyFormatProvider =
    CurrencyFormatNotifier(CurrencyFormatProvider.new);

class CurrencyFormatProvider extends Notifier<String> {
  @override
  String build() => ref.watch(settingsProvider.select((v) => v.currencyFormat));

  Future<void> changeCurrencyFormat(String currencyFormat) async {
    // await compute(_changeCurrencyFormat, _Data(ref.read(settingsProvider), currencyFormat));
    await ref.read(settingsProvider).copyWith(currencyFormat: currencyFormat).save();
  }
}

// void _changeCurrencyFormat(_Data data) {
//   openDBSync(data.dir);
//   data.setting.currencyFormat = data.currencyFormat;
//   data.setting.saveSync();
// }

// class _Data {
//   _Data(this.setting, this.currencyFormat);

//   final AppDir dir = appDir;
//   final String currencyFormat;
//   final AppSettings setting;
// }
