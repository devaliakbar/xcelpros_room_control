import 'dart:io';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class LocalStorage {
  String path;

  Future<void> init() async {
    Directory appDocumentDir =
        await path_provider.getApplicationDocumentsDirectory();

    path = appDocumentDir.path + "/hive_boxes";

    Hive.init(path);
  }

  Future<void> clearAllLocalData() async {
    var hiveDb = Directory(path);
    await hiveDb.delete(recursive: true);
  }
}
