import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:steno_game/model/user.dart';
import 'package:steno_game/repository/user_repository.dart';
import 'package:steno_game/services/shared_preference_service.dart';
import '../../../app/app.bottomsheets.dart';
import '../../../app/app.locator.dart';
import '../../../model/quiz.dart';
import '../../../model/quizzes.dart';
import '../../../repository/quiz_repository.dart';

class QuizViewModel extends BaseViewModel {
  final _quizRepo = locator<QuizRepository>();
  final _bottomSheet = locator<BottomSheetService>();
  final _sharedPref = locator<SharedPreferenceService>();
  final _userRepo = locator<UserRepository>();
  final _nav = locator<NavigationService>();

  User? user;
  int currentIndex = 0;
  int correctAnswer = 0;
  int score = 0;
  bool doneGame = false;

  Quizzes? game;
  List<Quiz> quizzes = [];
  QuizViewModel(this.game);

  init() async {
    setBusy(true);
    user = await _sharedPref.getCurrentUser();
    await getQuizzes();
    setBusy(false);
  }

  Future<void> getQuizzes() async {
    final results = await _quizRepo.getQuiz(game!.id);
    results.fold((l) => showBottomSheet(l.message), (r) {
      quizzes = r;
      rebuildUi();
    });
  }

  void answer(String answer) async {
    if (answer == quizzes[currentIndex].answer) {
      correctAnswer++;
      score += 1;
    }
    currentIndex++;
    if (currentIndex == quizzes.length) {
      doneGame = true;
    }
    if (doneGame) {
      setBusy(true);
      await addScore();
      if (!(user!.completedLevels.contains(game!.id))) {
        await addLevel();
      }
      setBusy(false);
    }
    rebuildUi();
  }

  Future<void> addScore() async {
    final response = await _userRepo.updateScore(score);
    response.fold((l) => showBottomSheet(l.message), (r) => null);
  }

  Future<void> addLevel() async {
    final response = await _userRepo.updateCompletedLevels(game!.id);
    response.fold((l) => showBottomSheet(l.message), (r) => null);
  }

  void showBottomSheet(String description) {
    _bottomSheet.showCustomSheet(
      variant: BottomSheetType.notice,
      title: "Notice",
      description: description,
    );
  }

  void back() {
    _nav.back();
  }
}