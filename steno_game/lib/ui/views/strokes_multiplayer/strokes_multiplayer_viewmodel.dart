import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:steno_game/app/app.bottomsheets.dart';
import 'package:steno_game/model/answer_stroke.dart';
import 'package:steno_game/model/question_stroke.dart';
import 'package:steno_game/model/user.dart';
import 'package:steno_game/services/shared_preference_service.dart';
import '../../../app/app.locator.dart';
import '../../../model/multiplayer_stroke.dart';
import '../../../model/student.dart';
import '../../../repository/multiplayer_stroke_repository.dart';
import '../../../repository/stroke_repository.dart';

class StrokesMultiplayerViewModel extends BaseViewModel {
  final _multiStroke = locator<MultiplayerStrokeRepository>();
  final _bottomSheet = locator<BottomSheetService>();
  final _sharedPref = locator<SharedPreferenceService>();
  final _stroke = locator<StrokeRepository>();
  final _nav = locator<NavigationService>();

  MultiplayerStroke game;

  TextEditingController answerController = TextEditingController();

  GlobalKey painterKey = GlobalKey();

  bool done = false;
  StrokesMultiplayerViewModel(this.game);
  List<QuestionStroke> questions = [];
  List<AnswerStroke> answers = [];

  StreamSubscription<List<Student>>? streamSubscription;
  StreamSubscription<MultiplayerStroke>? gameStreamSubscription;

  List<Student> students = [];

  int currentIndex = 0;
  int score = 0;
  late User user;
  init() async {
    setBusy(true);
    user = (await _sharedPref.getCurrentUser())!;
    final getQuestions = await _multiStroke.getQuestion(game.id);
    getQuestions.fold((l) => showBottomSheet(l.message), (questionsData) {
      questions = questionsData;
      rebuildUi();
    });
    gameStreamSubscription =
        _multiStroke.streamMultiplayerStroke(game.id).listen((event) async {
      game = event;
      if (game.status == 3) {
        setBusy(true);
        final getAnswers = await _multiStroke.getAnswers(game.id);
        getAnswers.fold((l) => showBottomSheet(l.message), (r) {
          answers = r;
          answers =
              answers.where((element) => element.userId == user.id).toList();
        });
      score = 0;
        for (var answer in answers) {
          if (game.correctAnswers.contains(answer.id)) {
            score++;
          }
        }
        final response = await _multiStroke.addScore(game.id, score);
        response.fold((l) => showBottomSheet(l.message), (r) {});
        for (AnswerStroke answer in answers) {
          if (game.correctAnswers.contains(answer.id) &&
              answer.stroke != null) {
            final setStroke = await _stroke.setStatus(answer.stroke!, 1);
            setStroke.fold((l) => showBottomSheet(l.message), (r) => () {});
          }
        }
        done = true;
        setBusy(false);
        rebuildUi();
      }
    });
    setBusy(false);
  }

  Future<void> getStudents() async {
    setBusy(true);
    final results = await _multiStroke.getStudents(game.id);
    results.fold((l) => showBottomSheet(l.message), (studentsData) {
      students = studentsData;
      rebuildUi();
      streamSubscription =
          _multiStroke.streamStudents(game.id).listen((studentsData) {
        students = studentsData;
        rebuildUi();
      });
    });
    setBusy(false);
  }

  void addTextAnswer() async {
    setBusyForObject("addText", true);
    final response = await _multiStroke.addAnswer(game.id,
        answerController.text, null, questions[currentIndex].id, user.id);
    setBusyForObject("addText", false);
    response.fold((l) => showBottomSheet(l.message), (answer) async {
      await next();
    });
  }

  void addStrokeAnswer() async {
    setBusyForObject("addStroke", true);
    final uploadPicResponse = await _stroke.addStroke(
        painterKey, questions[currentIndex].data, 0, null);
    uploadPicResponse.fold((l) => showBottomSheet(l.message), (stroke) async {
      final response = await _multiStroke.addAnswer(game.id, stroke.strokeImage,
          stroke.id, questions[currentIndex].id, user.id);
      response.fold((l) => showBottomSheet(l.message), (answer) async {
        await next();
      });
    });
    setBusyForObject("addStroke", false);
    setBusy(true);
    notifyListeners();
    setBusy(false);
  }

  void exit() {
    _nav.back();
  }

  void showBottomSheet(String description) {
    _bottomSheet.showCustomSheet(
      variant: BottomSheetType.notice,
      title: "Notice",
      description: description,
    );
  }

  Future<void> next() async {
    currentIndex++;
    if (currentIndex == questions.length) await getStudents();
    answerController.clear();
    rebuildUi();
  }

  @override
  void dispose() {
    streamSubscription?.cancel();
    gameStreamSubscription?.cancel();
    super.dispose();
  }
}
