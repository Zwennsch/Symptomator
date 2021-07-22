import 'package:flutter/material.dart';
import 'package:symptomator/screens/main_screen.dart';
import 'package:symptomator/styles/text_styles.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: const MainScreen(title: 'Symptomator'),
    );
  }
}
