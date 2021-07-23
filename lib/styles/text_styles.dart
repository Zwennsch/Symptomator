import 'package:flutter/material.dart';

const TextStyle nameStyle =
    TextStyle(color: Colors.black, fontSize: 25, fontFamily: 'Montserrat');

final appTheme = ThemeData(
  primarySwatch: Colors.purple,
  brightness: Brightness.light,
  // TODO: change the font family
  fontFamily: 'Montserrat',
  textTheme: const TextTheme(
    headline1: TextStyle(
        // fontFamily: 'IndieFlower',
        fontWeight: FontWeight.bold,
        fontSize: 72,
        color: Colors.green),
  ),
);
