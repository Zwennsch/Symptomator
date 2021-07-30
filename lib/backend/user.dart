import 'package:symptomator/backend/disease.dart';
import 'package:symptomator/backend/user_entry.dart';

class User {
  final String name1;

  // final int _id;
  final String surName1;

  List<Disease> diseases = [];

  final List<UserEntry> _allEntries = [];
  User({required this.name1, required this.surName1});
  User.fromString(String userDetails)
      // ignore: prefer_initializing_formals
      : name1 = userDetails,
        surName1 = 'wurst';

  // static User parse(String userDetailsFromFile) {
  //   return User('hams', 1, 'wurst');
  // }

  String get name => name1;
  String get surName => surName1;
  // TODO: this has to return an unmodifiable ListView
  // List<Disease> get diseases => _diseases;
  // void set diseases(List<Disease> diseases) {
  //   _diseases = diseases;
  // }

  List<UserEntry> get allEntries => _allEntries;
}
