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
    for (Disease disease in illnessList) {
      // FIXME: this assigns a 0 to all diseases but it should get the actual severity set by the user
      result.putIfAbsent(disease, () => disease.severity);
    }

    return result;
  }

  @override
  String toString() {
    // TODO: implement toString
    return "UserEntry on $date for ${user.name} is: $diseaseSeverityMap ";
  }
  // TODO: need to implement a equals method that return equality for the same day. 
  // this way a new entry on the same day should override the old one.
}
