import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

import '../../../db/isar.dart';
import '../model/currency/currency.model.dart';
import '../model/settings.model.dart';
import 'settings.provider.dart';

typedef CurrencyNotifier = AsyncNotifierProvider<CurrencyProvider, String>;

final currencyProvider = CurrencyNotifier(CurrencyProvider.new);

class CurrencyProvider extends AsyncNotifier<String> {
  late List<CurrencyProfile> currencies;

  @override
  FutureOr<String> build() async {
    currencies = await db.currencyProfiles.where().findAllAsync();
    return ref.watch(settingsProvider.select((v) => v.currency));
  }

  Future<void> changeCurrency(String currency) async {
    // await compute(_changeCurrency, _Data(ref.read(settingsProvider), currency));
    await ref.read(settingsProvider).copyWith(currency: currency).save();
  }
}

// void _changeCurrency(_Data data) {
//   openDBSync(data.dir);
//   data.setting.currency = data.currency;
//   data.setting.saveSync();
// }

// class _Data {
//   _Data(this.setting, this.currency);

//   final AppDir dir = appDir;
//   final String currency;
//   final AppSettings setting;
// }
