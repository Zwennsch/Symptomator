import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:symptomator/backend/user.dart';
import 'package:symptomator/screens/loading_screen.dart';
import 'package:symptomator/screens/new_user_screen.dart';
import 'package:symptomator/screens/main_screen.dart';
import 'package:symptomator/styles/text_styles.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      initialRoute: '/',
      routes: {
        '/': (context) => const LoadingScreen(),
        // '/': (context) => const NewUserScreen(),
        '/newUser': (context) => const NewUserScreen(),
        // TODO: Here a fix is needed, there shouldn't be a name here
        '/main': (context) => MainScreen(
              user: User(name: 'NEW', surName: 'USER'),
              newUser: true,
            ),
      },
      // home: const MainScreen(title: 'Symptomator'),
    );
  }
}
