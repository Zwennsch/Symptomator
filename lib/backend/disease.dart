import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Disease {
  final Icon icon;
  final String name;
  int severity = 0;

  Disease(this.icon, this.name);

  @override
  String toString() {
    return 'Disease: $name; Severity: $severity';
  }
  // int get severity() => _severity;
  // set severity(int severity) => _severity = severity;
}

class DiseaseListNotifier extends StateNotifier<List<Disease>> {
  DiseaseListNotifier() : super([]);

  void addNewDiseas(Disease disease) {
    state = [...state, disease];
  }

  void removeDiseaseByName(String name) {
    state = [
      for (final disease in state)
        if (disease.name != name) disease
    ];
  }
}
