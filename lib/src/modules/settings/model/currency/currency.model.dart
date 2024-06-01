import 'dart:convert';

import 'package:isar/isar.dart';

import '../../../../db/isar.dart';

part 'currency.model.crud.ext.dart';
part 'currency.model.ext.dart';
part 'currency.model.g.dart';

@Collection()
class CurrencyProfile {
  CurrencyProfile();

  @Id()
  late final int id;

  @Index(unique: true)
  late final String shortForm;
  late final String symbol;
  late final String name;

  factory CurrencyProfile.fromRawJson(String str) =>
      CurrencyProfile.fromJson(json.decode(str));

  factory CurrencyProfile.fromJson(Map<String, dynamic> json) =>
      CurrencyProfile()
        ..id = db.currencyProfiles.autoIncrement()
        ..name = json[_Json.name] as String
        ..symbol = json[_Json.symbol] as String
        ..shortForm = json[_Json.shortForm] as String;

  @override
  bool operator ==(Object other) => other is CurrencyProfile && id == other.id;

  @Ignore()
  @override
  int get hashCode => id.hashCode;
}

class _Json {
  static const id = 'id';
  static const String name = 'name';
  static const String symbol = 'symbol';
  static const String shortForm = 'short_form';
}
