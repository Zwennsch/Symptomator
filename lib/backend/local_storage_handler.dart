import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:symptomator/backend/user.dart';

class LocalStorageHandler {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/user.txt');
  }

  Future<User> readUser() async {
    try {
      final file = await _localFile;

      // Read the file
      final contents = await file.readAsString();
      print(contents);

      return User.fromString(contents);
    } catch (e) {
      print('Error in reading user' + e.toString());
      // If encountering an error, return 0
      return User('no', -1, 'nameOHHHH');
    }
  }

  Future<File> writeCounter(int counter) async {
    final file = await _localFile;

    // Write the file
    return file.writeAsString('$counter');
  }
}
