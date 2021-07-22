import 'package:flutter/material.dart';

const TextStyle nameStyle =
    TextStyle(color: Colors.black, fontSize: 25, fontFamily: 'IndieFlower');

final appTheme = ThemeData(
  primarySwatch: Colors.purple,
  brightness: Brightness.light,
  fontFamily: 'IndieFlower',
  textTheme: const TextTheme(
    headline1: TextStyle(
        // fontFamily: 'IndieFlower',
        fontWeight: FontWeight.bold,
        fontSize: 72,
        color: Colors.green),
  ),
);
