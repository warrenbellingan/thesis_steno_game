import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:steno_game/app/app.locator.dart';
import 'package:steno_game/app/app.router.dart';

class AddLessonDialogModel extends BaseViewModel {
  final _navSer = locator<NavigationService>();

  void goToAddStrokeLesson() {
    _navSer.navigateToAddStrokeLessonView(lesson: null);

  }
  void goToAddTypingLesson() {
    _navSer.navigateToAddTypingLessonView(lesson: null);

  }
}
