import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:symptomator/backend/local_storage_handler.dart';
import 'package:symptomator/backend/providers.dart';
import 'package:symptomator/backend/user.dart';
import 'package:symptomator/screens/main_screen.dart';
import 'package:symptomator/screens/new_user_screen.dart';

class LoadingScreen extends ConsumerStatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends ConsumerState<LoadingScreen> {
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
    // TODO: CircleProgress isnt' schowing correctly??
    Timer(const Duration(seconds: 2), () {});

    AsyncValue<User> user = ref.watch(userProvider);

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
      child: _isLoading
          ? const CircularProgressIndicator()
          : nextScreen(user.name),
    ));
  }

  Widget nextScreen(String userName) {
    if (_userFound) {
      return MainScreen(
        user: user,
        newUser: false,
      );
    } else {
      return const NewUserScreen();
    }
  }
}
