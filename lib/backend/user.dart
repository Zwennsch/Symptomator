import 'dart:collection';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:symptomator/backend/disease.dart';
import 'package:symptomator/backend/local_storage_handler.dart';
import 'package:symptomator/backend/user_entry.dart';

@immutable
class User {
  final String name;
  final String surName;

  /// the [List] of [Disease] the [User] used when logged in the last time.
  /// This [List] gets displayd in the [MainScreen] so that the user can immediately
  /// to insert new data.
  final List<Disease> _diseases = [];

  /// this Map contains all the stored [UserEntry] so far.
  final Map<DateTime, List<Disease>> _storedEntriesMappedByDate = {};

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

// TODO: this ist still very uncomplete! Diseases and userEntryMap has to be done
  User copyWith(
      {String? name,
      String? surName,
      List<Disease>? diseases,
      Map<DateTime, List<Disease>>? userEntriesMap}) {
    final User user =
        User(name: name ?? this.name, surName: surName ?? this.surName);
    return user;
  }

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
    final DateTime selectedDate = other.date;
    if (_storedEntriesMappedByDate.containsKey(selectedDate)) {
      _storedEntriesMappedByDate.remove(selectedDate);
    }
    _storedEntriesMappedByDate.putIfAbsent(selectedDate, () => _diseases);
  }

  Map<DateTime, List<Disease>> get storedEntries => _storedEntriesMappedByDate;
}

class UserNotifier extends StateNotifier<User> {
  UserNotifier() : super(User(name: 'mock', surName: 'surMock'));
}



// class DiseaseEntriesNotifier
//     extends StateNotifier<Map<DateTime, List<Disease>>> {
//   DiseaseEntriesNotifier() : super({});

//   Future<void> initStoredEntries() async {
//     state = await LocalStorageHandler().loadInitialUserEntriesMap();
//   }
// }
