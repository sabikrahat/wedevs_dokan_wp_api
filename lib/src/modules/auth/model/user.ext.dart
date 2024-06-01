part of 'user.dart';

extension UserExtension on User {
  User copyWith({
    String? token,
    String? userEmail,
    String? userNicename,
    String? userDisplayName,
  }) =>
      User()
        ..token = token ?? this.token
        ..userEmail = userEmail ?? this.userEmail
        ..userNicename = userNicename ?? this.userNicename
        ..userDisplayName = userDisplayName ?? this.userDisplayName;

  Map<String, dynamic> toJson() => {
        _Json.token: token,
        _Json.userEmail: userEmail,
        _Json.userNicename: userNicename,
        _Json.userDisplayName: userDisplayName,
      };

  String toRawJson() => json.encode(toJson());
}
