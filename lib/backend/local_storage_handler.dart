import 'dart:async';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:symptomator/backend/user.dart';

import 'disease.dart';

// TODO: his should probapely be implemented using an interface
class LocalStorageHandler {
  // this is supposed to make a singleton out of this class
  static final LocalStorageHandler _instance = LocalStorageHandler();

  factory LocalStorageHandler() => _instance;

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
      // TODO: add a remark/fix : if file does not exist => create it!
      final bool fileExists = await file.exists();
      print('File existiert: $fileExists');
      final contents = await file.readAsString();
      if (fileExists) {
        print(contents);
      }

      return User.fromString(contents);
    } catch (e) {
      print('Error in reading user :$e');
      // If encountering an error, return 0
      return User(name: 'no', surName: 'nameOHHHH');
    }
  }

  Future<File> writeUserDataToFile(User user) async {
    final file = await _localFile;

    // Write the file
    return file.writeAsString('user');
  }

  Future<Map<DateTime, List<Disease>>> loadInitialUserEntriesMap() {
    print('local user EntriesMap being loaded');
    // TODO: needs to be implemeted, maybe with e mock service first.
    return Future.delayed(const Duration(seconds: 1), () => {});
  }
}
