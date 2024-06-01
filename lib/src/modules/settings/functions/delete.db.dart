import 'dart:io';

import 'package:flutter/material.dart';

import '../../../db/isar.dart';
import '../../../db/paths.dart';

Future<void> deleteDB() async {
  debugPrint('Deleting Database : ${appDir.db}');
  final v = db.close(deleteFromDisk: true);
  debugPrint(v ? 'Database Closed!' : 'Database Not Closed!');
  await appDir.root.delete(recursive: true);
  exit(0);
}
