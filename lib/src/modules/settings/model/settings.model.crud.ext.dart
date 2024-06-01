part of 'settings.model.dart';

extension AppSettingsDBExt on AppSettings {
  void saveSync() => db.write((isar) => isar.appSettings.put(this));

  Future<void> save() async =>
      await db.writeAsync((isar) => isar.appSettings.put(this));

  bool deleteSync() => db.write((isar) => isar.appSettings.delete(this.id));

  Future<bool> delete() async =>
      await db.writeAsync((isar) => isar.appSettings.delete(this.id));
}
