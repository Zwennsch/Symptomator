import 'package:symptomator/backend/disease.dart';
import 'package:symptomator/backend/user.dart';

class UserEntry {
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
