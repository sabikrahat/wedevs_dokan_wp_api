import 'dart:convert';

import 'package:isar/isar.dart';

import '../../../db/isar.dart';

part 'user.ext.dart';
part 'user.ext.db.dart';
part 'user.g.dart';

@Collection()
class User {
  User();

  final int id = 0;
  String? token;
  String? userEmail;
  String? userNicename;
  String? userDisplayName;

  factory User.fromJson(Map<String, dynamic> json) => User()
    ..token = json[_Json.token]
    ..userEmail = json[_Json.userEmail]
    ..userNicename = json[_Json.userNicename]
    ..userDisplayName = json[_Json.userDisplayName];

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  @override
  String toString() =>
      'User(token: $token, userEmail: $userEmail, userNicename: $userNicename, userDisplayName: $userDisplayName)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is User && other.userEmail == userEmail;
  }

  @override
  int get hashCode => userEmail.hashCode;
}

class _Json {
  static const token = 'token';
  static const userEmail = 'user_email';
  static const userNicename = 'user_nicename';
  static const userDisplayName = 'user_display_name';
}
