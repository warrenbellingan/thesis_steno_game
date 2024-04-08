import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:steno_game/model/steno_stroke.dart';
import 'package:steno_game/model/user.dart';
import 'package:steno_game/repository/stroke_repository.dart';
import 'package:steno_game/repository/user_repository.dart';
import 'package:steno_game/services/shared_preference_service.dart';
import 'package:steno_game/storage/quiz_storage.dart';
import 'package:steno_game/storage/stroke_storage.dart';
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
  final _strokeRepo = locator<StrokeRepository>();

  User? user;
  int currentIndex = 0;
  int correctAnswer = 0;
  int score = 0;
  bool doneGame = false;
  bool isOnline;

  StenoStroke? stroke;
  Quizzes? game;
  List<Quiz> quizzes = [];
  List<String> choices = [];
  QuizViewModel(this.game, this.isOnline);

  init() async {
    setBusy(true);
    user = await _sharedPref.getCurrentUser();
    setBusy(false);
    if(isOnline) {
      await getQuizzes();
    }
    else {
      getOfflineQuizzes();
    }
    if(quizzes.isNotEmpty) {
      await getStroke();
    }
  }

  void getOfflineQuizzes() {
    setBusy(true);
    QuizStorage storage = QuizStorage();
    quizzes = storage.getQuiz(game!.id);
    if(quizzes.isNotEmpty) {
      quizzes.shuffle();
      choices = List<String>.from(quizzes[currentIndex].choices);
      choices.shuffle();
    }
    rebuildUi();
    setBusy(false);
  }
  Future<void> getQuizzes() async {
    setBusy(true);
    final results = await _quizRepo.getQuiz(game!.id);
    results.fold((l) => showBottomSheet(l.message), (r) async{
      quizzes = r;
      if(quizzes.isNotEmpty) {
        quizzes.shuffle();
        choices = List<String>.from(quizzes[currentIndex].choices);
        choices.shuffle();
      }
    });
    rebuildUi();
    setBusy(false);
  }

  void answer(String answer) async {

    setBusy(true);
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
    else {
      await getStroke();
      if(quizzes.isNotEmpty) {
        choices = List<String>.from(quizzes[currentIndex].choices);
        choices.shuffle();
      }
      rebuildUi();
    }
    setBusy(false);
    rebuildUi();
  }
  Future<void> getStroke() async {
    setBusy(true);
    rebuildUi();
    if(isOnline) {
      final response = await _strokeRepo.getStroke(quizzes[currentIndex].stroke);
      response.fold((l) => showBottomSheet(l.message), (r){
        stroke = r;
        rebuildUi();
      });
    }
    else {
      StrokeStorage storage = StrokeStorage();
      stroke = storage.getSteno(quizzes[currentIndex].stroke);
      rebuildUi();
    }

    setBusy(false);
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
