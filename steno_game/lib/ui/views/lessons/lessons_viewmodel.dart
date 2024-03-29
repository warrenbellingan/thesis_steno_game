import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:steno_game/app/app.bottomsheets.dart';
import 'package:steno_game/app/app.locator.dart';
import 'package:steno_game/app/app.router.dart';
import 'package:steno_game/model/lesson.dart';
import 'package:steno_game/repository/lesson_repository.dart';

class LessonsViewModel extends BaseViewModel {
  final _lessonRepo = locator<LessonRepository>();
  final _bottomSheet = locator<BottomSheetService>();
  final _navigationService = locator<NavigationService>();

  List<Lesson> lessons = [];

  int selectedIndex = 1;

  void init() async {
    getLessons("strokes");
  }

  Future<void> getLessons(String type) async {
    if (type == "strokes") {
      selectedIndex = 1;
    } else {
      selectedIndex = 2;
    }
    rebuildUi();

    setBusy(true);
    final response = await _lessonRepo.getLessons(type);
    response.fold((l) => showBottomSheet(l.message), (lessonsData) {
      lessons = lessonsData;
      rebuildUi();
    });
    setBusy(false);
  }

  void lessonClick(Lesson lesson) {
    _navigationService.navigateToTopicView(lesson: lesson);
  }

  void showBottomSheet(String description) {
    _bottomSheet.showCustomSheet(
      variant: BottomSheetType.notice,
      title: "Notice",
      description: description,
    );
  }
}
