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

/// this Map has all the stored [UserEntry] so far. 
  final Map<DateTime, List<Disease>> _storedEntries = {};

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

  void addEntry(UserEntry other) {
    DateTime selectedDate = other.date;
    if (_storedEntries.containsKey(selectedDate)) {
      _storedEntries.remove(selectedDate);
    }
    _storedEntries.putIfAbsent(selectedDate, () => _diseases);
  }

  Map<DateTime, List<Disease>> get storedEntries => _storedEntries;
}
