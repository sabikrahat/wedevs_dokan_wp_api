part of 'user.dart';

extension UserDBExtension on User {
  void saveSync() => db.write((isar) => isar.users.put(this));

  Future<void> save() async =>
      await db.writeAsync((isar) => isar.users.put(this));

  bool deleteSync() => db.write((isar) => isar.users.delete(this.id));

  Future<bool> delete() async =>
      await db.writeAsync((isar) => isar.users.delete(this.id));
}

extension ListUserDBExt on List<User> {
  void saveSync() => db.write((isar) => isar.users.putAll(this));

  Future<void> save() async =>
      await db.writeAsync((isar) => isar.users.putAll(this));

  int deleteSync() =>
      db.write((isar) => isar.users.deleteAll(map((e) => e.id).toList()));

  Future<int> delete() async => await db
      .writeAsync((isar) => isar.users.deleteAll(map((e) => e.id).toList()));
}
