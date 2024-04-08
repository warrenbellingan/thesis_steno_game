import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:steno_game/app/app.locator.dart';
import 'package:steno_game/app/app.router.dart';
import 'package:steno_game/model/quizzes.dart';
import 'package:steno_game/services/shared_preference_service.dart';
import 'package:steno_game/storage/quiz_storage.dart';

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

  bool isOffline = true;

  init() async {
    setBusy(true);
    user = await _sharedPref.getCurrentUser();
    if (isOffline) {
      getQuizzesOffline();
    } else {
      await getQuizzes();
    }
    setBusy(false);
  }

  void selectMode(bool status) async {
    isOffline = status;
    if (isOffline) {
      getQuizzesOffline();
    } else {
      await getQuizzes();
    }
  }

  void getQuizzesOffline() {
    quizzes = [];
    setBusy(true);
    QuizStorage storage = QuizStorage();
    quizzes = storage.getQuizzes();
    rebuildUi();
    setBusy(false);
  }

  Future<void> getQuizzes() async {
    quizzes = [];
    setBusy(true);
    final results = await _quizRepo.getQuizzes();
    results.fold((l) => showBottomSheet(l.message), (r) {
      quizzes = r;
      rebuildUi();
    });
    setBusy(false);
  }

  void goToQuiz(Quizzes quiz) {
    _navigationService.navigateToQuizView(game: quiz, isOnline: !isOffline);
  }

  void deleteQuiz(String id) async {
    setBusy(true);
    final response = await _quizRepo.deleteQuiz(id);
    response.fold((l) => showBottomSheet(l.message), (r) async {
      await getQuizzes();
      rebuildUi();
    });
    setBusy(false);
  }

  void showBottomSheet(String description) {
    _bottomSheet.showCustomSheet(
      variant: BottomSheetType.notice,
      title: "Notice",
      description: description,
    );
  }

  void addQuiz() {
    _navigationService.navigateToAddEditQuizView(quizzes: null);
  }

  editQuiz(Quizzes quiz) {
    _navigationService.navigateToAddEditQuizView(quizzes: quiz);
  }
}
