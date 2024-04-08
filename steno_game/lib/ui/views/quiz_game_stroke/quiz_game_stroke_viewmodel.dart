import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:steno_game/app/app.locator.dart';
import 'package:steno_game/app/app.router.dart';
import 'package:steno_game/model/quizzes.dart';
import 'package:steno_game/services/shared_preference_service.dart';

import '../../../app/app.bottomsheets.dart';
import '../../../model/user.dart';
import '../../../repository/quiz_repository.dart';

class QuizGameStrokeViewModel extends BaseViewModel {
  final _quizRepo = locator<QuizRepository>();
  final _bottomSheet = locator<BottomSheetService>();
  final _navigationService = locator<NavigationService>();
  final _sharedPref = locator<SharedPreferenceService>();

  List<Quizzes> quizzes = [];
  User? user;

  init() async {
    setBusy(true);
    user = await _sharedPref.getCurrentUser();
    await getQuizzes();
  }

  Future<void> getQuizzes() async {
    setBusy(true);
    final results = await _quizRepo.getQuizzes();
    results.fold((l) => showBottomSheet(l.message), (r) {
      quizzes = r;
      rebuildUi();
    });
    setBusy(false);
  }

  void goToQuiz(Quizzes quiz) {
    _navigationService.navigateToQuizView(game: quiz);
  }

  void showBottomSheet(String description) {
    _bottomSheet.showCustomSheet(
      variant: BottomSheetType.notice,
      title: "Notice",
      description: description,
    );
  }

  void addQuiz() {
    _navigationService.navigateToAddEditQuizView();
  }
}
