import 'dart:async';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:steno_game/app/app.router.dart';
import 'package:steno_game/model/answer_stroke.dart';
import 'package:steno_game/model/multiplayer_stroke.dart';
import 'package:steno_game/model/question_stroke.dart';
import 'package:steno_game/repository/stroke_repository.dart';
import '../../../app/app.bottomsheets.dart';
import '../../../app/app.locator.dart';
import '../../../model/student.dart';
import '../../../repository/multiplayer_stroke_repository.dart';
import '../../../services/shared_preference_service.dart';

class MultiplayerStrokeHostViewModel extends BaseViewModel {
  final _multiStroke = locator<MultiplayerStrokeRepository>();
  final _bottomSheet = locator<BottomSheetService>();
  final _nav = locator<NavigationService>();

  MultiplayerStroke game;
  MultiplayerStrokeHostViewModel(this.game);

  List<QuestionStroke> questions = [];
  List<AnswerStroke> answers = [];
  List<String> correctAnswers = [];
  List<String> wrongAnswers = [];
  List<Student> students = [];

  StreamSubscription<List<AnswerStroke>>? streamSubscription;

  init() async {
    setBusy(true);
    final getQuestions = await _multiStroke.getQuestion(game.id);
    getQuestions.fold((l) => showBottomSheet(l.message), (questionsData) {
      questions = questionsData;
    });
    final getStudents = await _multiStroke.getStudents(game.id);
    getStudents.fold((l) => showBottomSheet(l.message), (r) {
      students = r;
    });
    streamSubscription =
        _multiStroke.streamAnswers(game.id).listen((answersData) {
      answers = answersData;
      rebuildUi();
    });
    rebuildUi();
    setBusy(false);
  }

  bool isAllAnswer() {
    return answers.length == correctAnswers.length + wrongAnswers.length;
  }

  void submitAnswers() async {
    if (!isAllAnswer()) {
      showBottomSheet("There is unchecked answers");
      return;
    }
    setBusyForObject("submit", true);
    final response =
        await _multiStroke.addCorrectAnswers(game.id, correctAnswers);
    response.fold((l) => showBottomSheet(l.message), (r) async {
      final setStatus = await _multiStroke.setGameStatus(game.id, 3);
      setStatus.fold((l) => showBottomSheet(l.message), (r) async{
        final getGame = await _multiStroke.getGame(game.id);
        getGame.fold((l) => showBottomSheet(l.message), (newGameData) {
          _nav.replaceWithMultiplayerStrokeHostResultsView(game: newGameData);
        });
      });
    });
    setBusyForObject("submit", false);
    rebuildUi();
  }

  void addCorrectAnswers(String answerId) {
    if (correctAnswers.contains(answerId)) {
      return;
    } else if (wrongAnswers.contains(answerId)) {
      wrongAnswers.remove(answerId);
      correctAnswers.add(answerId);
    } else {
      correctAnswers.add(answerId);
    }
    rebuildUi();
  }

  void addWrongAnswers(String answerId) {
    if (wrongAnswers.contains(answerId)) {
      return;
    } else if (correctAnswers.contains(answerId)) {
      correctAnswers.remove(answerId);
      wrongAnswers.add(answerId);
    } else {
      wrongAnswers.add(answerId);
    }
    rebuildUi();
  }

  bool isCorrect(String answerId) {
    return correctAnswers.contains(answerId);
  }

  bool isWrong(String answerId) {
    return wrongAnswers.contains(answerId);
  }

  Student getPlayer(String id) {
    return students.where((student) => student.id == id).first;
  }

  List<AnswerStroke> findQuestionAnswer(String questionId) {
    return answers
        .where((answers) => answers.questionId == questionId)
        .toList();
  }

  void showBottomSheet(String description) {
    _bottomSheet.showCustomSheet(
      variant: BottomSheetType.notice,
      title: "Notice",
      description: description,
    );
  }

  @override
  void dispose() {
    streamSubscription?.cancel();
    super.dispose();
  }
}
