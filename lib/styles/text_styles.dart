import 'package:flutter/material.dart';

const TextStyle nameStyle =
    TextStyle(color: Colors.black, fontSize: 25, fontFamily: 'Montserrat');

// TODO: create a true theme for ALL cases (light, dark, headline....)
final appTheme = ThemeData(
  primarySwatch: Colors.purple,
  brightness: Brightness.light,
  fontFamily: 'Montserrat',
  textTheme: const TextTheme(
    headline1: TextStyle(
        // fontFamily: 'IndieFlower',
        fontWeight: FontWeight.bold,
        fontSize: 32,
        // FIXME: This should not be here, so above todo!
        color: Colors.deepPurple),
  ),
);
