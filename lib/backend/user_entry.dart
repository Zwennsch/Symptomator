import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:symptomator/backend/disease.dart';
import 'package:symptomator/backend/user.dart';

/// Base class for an entry a [User] makes. A [UserEntry] contains of a date,
/// a [User] and a [List] of [Disease]. This entry gets updated, when a [User]
/// enters a new Set of Disease on a specific date. 
/// This is just a [UserEntry] for one day. 
class UserEntry{
  final DateTime date;
  final User user;
  final List<Disease> diseaseSeverityList;

  UserEntry(
      {required this.user,
      required this.date,
      required this.diseaseSeverityList});

  static Map<Disease, int> getMapFromIllnessList(List<Disease> illnessList) {
    final Map<Disease, int> result = {};
    for (final Disease disease in illnessList) {
      result.putIfAbsent(disease, () => disease.severity);
    }

    return result;
  }

  // static Map<DateTime, List<Disease>> getDateDiseasesMap()

  bool isTheSameDay(DateTime other) {
    if (!(date.day == other.day)) return false;
    if (!(date.month == other.month)) return false;
    if (!(date.year == other.year)) return false;
    return true;
  }

  @override
  String toString() {
    return "UserEntry on $date for ${user.name} is: $diseaseSeverityList ";
  }
}
