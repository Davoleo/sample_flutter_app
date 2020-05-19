
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

abstract class FileUtils {

  static Future<String> get _localPath async {
    final Directory directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  static Future<File> get _localFile async {
    final path = await _localPath;
    return File(join(path, "data.txt"));
  }

  static Future<bool> save(String data) async {
    File file = await _localFile;
    file.writeAsString(data, mode: FileMode.write);
    return true;
  }

  static Future<String> load() async {
    File file = await _localFile;
    return file.readAsString();
  }

}