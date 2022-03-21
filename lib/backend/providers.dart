import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:symptomator/backend/disease.dart';
import 'package:symptomator/backend/local_storage_handler.dart';
import 'package:symptomator/mock/mock_user.dart';

import 'user.dart';

final listOfDiseasesProvider =
    StateNotifierProvider<DiseaseListNotifier, List<Disease>>(
        (ref) => DiseaseListNotifier());

final mockUserProvider = StateProvider<User>((ref) {
  return MockUser.instance();
});

final futureUserProvider = FutureProvider<User>((ref) async {
  final LocalStorageHandler handler = LocalStorageHandler();
  final User user = await handler.readUser();
  return user;
});

final userProvider =
    StateNotifierProvider<UserNotifier, User>((ref) => UserNotifier());
