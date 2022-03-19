import 'package:symptomator/backend/user.dart';

class MockUser extends User {
  MockUser({required String name, required String surName})
      : super(name: name, surName: surName);

  static final MockUser _instance =
      MockUser(name: 'Mock', surName: 'MochSurName');

  factory MockUser.instance() => _instance;

  
}
