import 'package:symptomator/backend/disease.dart';
import 'package:symptomator/backend/user.dart';

class UserEntry {
  final DateTime date;
  final User user;
  final Map<Disease, int> diseaseSeverityMap;

  UserEntry(
      {required this.user,
      required this.date,
      required this.diseaseSeverityMap});
// TODO: finish helper-method
  static Map<Disease, int> getMapFromIllnessList(List<Disease> illnessList) {
    final Map<Disease, int> result = {};
    for (final Disease disease in illnessList) {
      result.putIfAbsent(disease, () => disease.severity);
    }

    return result;
  }

  bool isTheSameDay(DateTime other) {
    if (!(date.day == other.day)) return false;
    if (!(date.month == other.month)) return false;
    if (!(date.year == other.year)) return false;
    return true;
  }

  @override
  String toString() {
    return "UserEntry on $date for ${user.name} is: $diseaseSeverityMap ";
  }
}
