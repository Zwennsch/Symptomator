import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:symptomator/backend/disease.dart';

import 'user.dart';

final listOfDiseasesProvider =
    StateNotifierProvider<DiseaseListNotifier, List<Disease>>(
        (ref) => DiseaseListNotifier());

// final userProvider = Provider<User>((ref) {
//   return User(name: 'hans', surName: 'Walter');
// });
