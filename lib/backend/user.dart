import 'package:symptomator/backend/disease.dart';

class User {
  final String _name;
  final int _id;
  final String _surName;

  final List<Desease> diseases = [];

  User(this._name, this._id, this._surName);
  User.fromString(String userDetails)
      // ignore: prefer_initializing_formals
      : _name = userDetails,
        _id = 84,
        _surName = 'wurst';

  // static User parse(String userDetailsFromFile) {
  //   return User('hams', 1, 'wurst');
  // }

  String get name => _name;
}
