import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:steno_game/app/app.bottomsheets.dart';
import 'package:steno_game/app/app.locator.dart';
import 'package:steno_game/app/app.router.dart';
import 'package:steno_game/model/lesson.dart';
import 'package:steno_game/repository/lesson_repository.dart';
import 'package:steno_game/services/shared_preference_service.dart';
import 'package:steno_game/storage/lesson_storage.dart';

import '../../../model/user.dart';

class LessonsViewModel extends BaseViewModel {
  final _lessonRepo = locator<LessonRepository>();
  final _bottomSheet = locator<BottomSheetService>();
  final _navigationService = locator<NavigationService>();
  final _sharedPref = locator<SharedPreferenceService>();
  late User user;

  bool isOffline = true;

  List<Lesson> lessons = [];

  init() async {
    user = (await _sharedPref.getCurrentUser())!;
    getOfflineLessons();
  }

  void selectMode(bool status) async {
    isOffline = status;
    if (isOffline) {
      getOfflineLessons();
    } else {
      await getLessons();
    }
  }

  void getOfflineLessons() {
    lessons = [];
    setBusy(true);
    LessonStorage lessonStorage = LessonStorage();
    lessons = lessonStorage.getLessons();
    setBusy(false);
    rebuildUi();
  }

  Future<void> getLessons() async {
    lessons = [];
    setBusy(true);
    final response = await _lessonRepo.getLessons();
    response.fold((l) => showBottomSheet(l.message), (lessonsData) {
      lessons = lessonsData;
      rebuildUi();
    });
    setBusy(false);
  }

  void lessonClick(Lesson lesson) {
    _navigationService.navigateToTopicView(
        lesson: lesson, isOnline: !isOffline);
  }

  void lessonDeleteClick(Lesson lesson) async {
    setBusy(true);
    final response = await _lessonRepo.deleteLesson(lesson.id);
    response.fold((l) => showBottomSheet(l.message), (r) async {
      await getLessons();
      showBottomSheet("Deleted Successfully");
    });
    setBusy(false);
  }

  void lessonEditClick(Lesson lesson) {
    _navigationService.navigateToAddStrokeLessonView(lesson: lesson);
  }

  void showBottomSheet(String description) {
    _bottomSheet.showCustomSheet(
      variant: BottomSheetType.notice,
      title: "Notice",
      description: description,
    );
  }
}
