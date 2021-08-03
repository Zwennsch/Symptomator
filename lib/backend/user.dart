import 'dart:collection';

import 'package:symptomator/backend/disease.dart';
import 'package:symptomator/backend/user_entry.dart';

class User {
  final String name1;

  final String surName1;

  /// the list of diseases the user used when logged in the last time.
  /// This list gets displayd in the main_screen so that the user can immediately
  /// to insert new data.
  List<Disease> _diseases = [];

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

  UnmodifiableListView<Disease> get diseases {
    return UnmodifiableListView(_diseases);
  }

  void removeDisease(Disease disease) {
    _diseases.remove(disease);
  }

  void addDisease(Disease disease) {
    _diseases.add(disease);
  }

  set diseases(List<Disease> diseases) {
    _diseases = diseases;
  }

  List<UserEntry> get allEntries => _allEntries;
}
