import 'package:symptomator/backend/disease.dart';

class User {
  final String _name;

  // final int _id;
  final String _surName;

  final List<Disease> _diseases = [];

  User(this._name, this._surName);
  User.fromString(String userDetails)
      // ignore: prefer_initializing_formals
      : _name = userDetails,
        _surName = 'wurst';

  // static User parse(String userDetailsFromFile) {
  //   return User('hams', 1, 'wurst');
  // }

  String get name => _name;
  String get surName => _surName;
  // TODO: this has to return an unmodifiable ListView
  List<Disease> get diseases => _diseases;
}
