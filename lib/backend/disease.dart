import 'package:flutter/material.dart';

class Disease {
  final Icon icon;
  final String name;

  Disease(this.icon, this.name);

  @override
  String toString() {
    // TODO: implement toString
    return 'name: $name';
  }
}
