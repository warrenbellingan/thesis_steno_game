// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, implementation_imports, depend_on_referenced_packages

import 'package:stacked_services/src/bottom_sheet/bottom_sheet_service.dart';
import 'package:stacked_services/src/dialog/dialog_service.dart';
import 'package:stacked_services/src/navigation/navigation_service.dart';
import 'package:stacked_services/src/snackbar/snackbar_service.dart';
import 'package:stacked_shared/stacked_shared.dart';

import '../repository/lesson_repository.dart';
import '../repository/multiplayer_stroke_repository.dart';
import '../repository/stroke_repository.dart';
import '../repository/topic_repository.dart';
import '../repository/user_repository.dart';
import '../services/authentication_service.dart';
import '../services/image_service.dart';
import '../services/internet_service.dart';
import '../services/shared_preference_service.dart';

final locator = StackedLocator.instance;

Future<void> setupLocator({
  String? environment,
  EnvironmentFilter? environmentFilter,
}) async {
// Register environments
  locator.registerEnvironment(
      environment: environment, environmentFilter: environmentFilter);

// Register dependencies
  locator.registerLazySingleton(() => BottomSheetService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => SharedPreferenceService());
  locator.registerLazySingleton(() => ImageService());
  locator.registerLazySingleton(() => UserRepository());
  locator.registerLazySingleton(() => LessonRepository());
  locator.registerLazySingleton(() => TopicRepository());
  locator.registerLazySingleton(() => StrokeRepository());
  locator.registerLazySingleton(() => MultiplayerStrokeRepository());
  locator.registerLazySingleton(() => InternetService());
  locator.registerLazySingleton(() => SnackbarService());
}
