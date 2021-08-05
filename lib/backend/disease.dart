import 'package:flutter/material.dart';

class Disease {
  final Icon icon;
  final String name;
  int severity = 0;

  Disease(this.icon, this.name);

  @override
  String toString() {
    return 'Disease: $name';
  }
  // int get severity() => _severity;
  // set severity(int severity) => _severity = severity;
}
