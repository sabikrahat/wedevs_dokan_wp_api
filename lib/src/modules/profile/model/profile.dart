import 'dart:convert';

import '../../../utils/extensions/extensions.dart';

part 'profile.ext.dart';

class Profile {
  int? id;
  String? username;
  String? name;
  String? email;
  String? description;

  Profile({
    this.id,
    this.username,
    this.name,
    this.email,
    this.description,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      id: json[_Json.id]?.toString().toInt,
      username: json[_Json.username],
      name: json[_Json.name],
      email: json[_Json.email],
      description: json[_Json.description],
    );
  }

  factory Profile.fromRawJson(String str) => Profile.fromJson(json.decode(str));

  @override
  String toString() =>
      'Profile(id: $id, username: $username, name: $name, email: $email, description: $description)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Profile && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}

class _Json {
  static const id = 'id';
  static const username = 'username';
  static const name = 'name';
  static const email = 'email';
  static const description = 'description';
}
