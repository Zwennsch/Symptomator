import 'package:flutter/material.dart';
import 'package:symptomator/backend/local_storage_handler.dart';
import 'package:symptomator/backend/user.dart';
import 'package:symptomator/screens/main_screen.dart';
import 'package:symptomator/screens/new_user_screen.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  final LocalStorageHandler handler = LocalStorageHandler();
  late User user;
  bool _userFound = false;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    dataLoadFunction();
  }

  Future<void> dataLoadFunction() async {
    setState(() {
      _isLoading = true;
    });
    user = await handler.readUser();

    if (user.name != 'no') {
      _userFound = true;
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: _isLoading ? const CircularProgressIndicator() : nextScreen(user.name),
    ));
  }

  Widget nextScreen(String userName) {
    if (_userFound) {
      return MainScreen(title: 'Sympto', name: userName);
    } else {
      return const NewUserScreen();
    }
  }
}
