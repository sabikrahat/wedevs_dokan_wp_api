import 'dart:convert';

import 'package:flutter/foundation.dart' show kReleaseMode;
import 'package:flutter/services.dart';
import 'package:isar/isar.dart';

import '../config/constants.dart';
import '../config/get.platform.dart';
import '../modules/settings/model/currency/currency.model.dart';
import '../modules/settings/model/settings.model.dart';
import '../utils/extensions/extensions.dart';
import '../utils/logger/logger_helper.dart';
import 'paths.dart' show AppDir, appDir, initDir;

late final Isar db;
late AppSettings appSettings;
late CurrencyProfile appCurrency;

const _schemas = [AppSettingsSchema, CurrencyProfileSchema];

Future<void> openDB() async {
  await initDir();
  db = pt.isWeb
      ? Isar.open(
          schemas: _schemas,
          inspector: !kReleaseMode,
          name: appName.toCamelWord,
          directory: '',
          engine: IsarEngine.sqlite,
        )
      : await Isar.openAsync(
          schemas: _schemas,
          inspector: !kReleaseMode,
          name: appName.toCamelWord,
          directory: appDir.db.path,
          engine: IsarEngine.isar,
        );
}

void openDBSync(AppDir dir) => db = Isar.open(
      schemas: _schemas,
      directory: dir.db.path,
      inspector: !kReleaseMode,
      name: appName.toCamelWord,
      engine: pt.isWeb ? IsarEngine.sqlite : IsarEngine.isar,
    );

Future<void> initAppDatum() async {
  if (await db.currencyProfiles.where().countAsync() == 0) await currencyInit();
  appSettings = await initAppSettings();
  appCurrency = (await db.currencyProfiles
      .where()
      .shortFormEqualTo(appSettings.currency)
      .findFirstAsync())!;
  log.i('App Initiated with currency: ${appCurrency.shortForm}');
  listenForAppConfig();
}

Future<AppSettings> initAppSettings() async {
  final aps = await db.appSettings.getAsync(0);
  if (aps == null) {
    final settings = AppSettings();
    await settings.save();
    return settings;
  }
  return aps;
}

Future<void> currencyInit() async {
  List<CurrencyProfile> currencies = [];
  final currenciesJson =
      await rootBundle.loadString('assets/json/currency_data.json');
  final jsonList = jsonDecode(currenciesJson) as List;
  for (final json in jsonList) {
    final curr = CurrencyProfile.fromJson(json);
    currencies.add(curr);
  }
  log.i('First time Currency Initiated with ${currencies.length} currencies');
  await currencies.saveAll();
}

void listenForAppConfig() =>
    db.appSettings.watchObjectLazy(0).listen((_) async {
      appSettings = await db.appSettings.getAsync(0) ?? AppSettings();
      appCurrency = (await db.currencyProfiles
          .where()
          .shortFormEqualTo(appSettings.currency)
          .findFirstAsync())!;
    });
