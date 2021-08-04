import 'dart:collection';

import 'package:symptomator/backend/disease.dart';
import 'package:symptomator/backend/user_entry.dart';

class User {
  final String name;

  final String surName;

  /// the list of diseases the user used when logged in the last time.
  /// This list gets displayd in the main_screen so that the user can immediately
  /// to insert new data.
  List<Disease> _diseases = [];

  /// the list of [UserEntry] that the user stored previoulsy. 
  final List<UserEntry> _allEntries = [];

  
  User({required this.name, required this.surName});
  
  User.fromString(String userDetails)
      // ignore: prefer_initializing_formals
      : name = userDetails,
        surName = 'wurst';

  // static User parse(String userDetailsFromFile) {
  //   return User('hams', 1, 'wurst');
  // }

  // String get name => name;
  // String get surName => surName;

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
