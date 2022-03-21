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
  final List<Disease> diseases = [];

  /// this Map contains all the stored [UserEntry] so far.
  final Map<DateTime, List<Disease>> storedEntriesMappedByDate = {};

  User({
    required this.name,
    required this.surName,
  });

  User.fromString(String userDetails)
      // ignore: prefer_initializing_formals
      : name = userDetails,
        surName = 'wurst';

  // static User parse(String userDetailsFromFile) {
  //   return User('hams', 1, 'wurst');
  // }

  // String get name => name;
  // String get surName => surName;

  User copyWith(
      {String? name,
      String? surName,
      List<Disease>? dis,
      Map<DateTime, List<Disease>>? userEntriesMap}) {
    final User user =
        User(name: name ?? this.name, surName: surName ?? this.surName);
    if (dis != null) user.diseases = dis;
    if (userEntriesMap != null) user.storedEntriesMappedByDate = userEntriesMap;
    return user;
  }

  // UnmodifiableListView<Disease> get diseases {
  //   return UnmodifiableListView(diseases);
  // }

  void removeDisease(Disease disease) {
    diseases.remove(disease);
  }

  void addDisease(Disease disease) {
    diseases.add(disease);
  }

  set storedEntriesMappedByDate(Map<DateTime, List<Disease>> map) {
    storedEntriesMappedByDate = map;
  }

  set diseases(List<Disease> dis) {
    diseases = dis;
  }

  void addEntry(UserEntry other) {
    final DateTime selectedDate = other.date;
    if (storedEntriesMappedByDate.containsKey(selectedDate)) {
      storedEntriesMappedByDate.remove(selectedDate);
    }
    storedEntriesMappedByDate.putIfAbsent(selectedDate, () => diseases);
  }

  Map<DateTime, List<Disease>> get storedEntries => storedEntriesMappedByDate;
}

class UserNotifier extends StateNotifier<User> {
  UserNotifier() : super(User(name: 'mock', surName: 'surMock'));

  void setName(String name, String surname) {
    state = state.copyWith(name: name, surName: surname);
  }

  void setList(List<Disease> newList) {
    state = state.copyWith(dis: newList);
  }

  void setMap(Map<DateTime, List<Disease>> newMap) {
    state = state.copyWith(userEntriesMap: newMap);
  }
}



// class DiseaseEntriesNotifier
//     extends StateNotifier<Map<DateTime, List<Disease>>> {
//   DiseaseEntriesNotifier() : super({});

//   Future<void> initStoredEntries() async {
//     state = await LocalStorageHandler().loadInitialUserEntriesMap();
//   }
// }
