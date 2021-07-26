import 'package:symptomator/backend/disease.dart';
import 'package:symptomator/backend/user.dart';

class UserEntry {
  String date;
  User user;
  Map<Disease, int> diseaseSeverity;

  UserEntry(
      {required this.user, required this.date, required this.diseaseSeverity});
}
