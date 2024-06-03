part of 'profile.dart';

extension ProfileExtension on Profile {
  Profile copyWith({
    int? id,
    String? username,
    String? name,
    String? email,
    String? description,
  }) {
    return Profile(
      id: id ?? this.id,
      username: username ?? this.username,
      name: name ?? this.name,
      email: email ?? this.email,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      _Json.id: id,
      _Json.username: username,
      _Json.name: name,
      _Json.email: email,
      _Json.description: description,
    };
  }

  String toRawJson() => json.encode(toJson());
}
