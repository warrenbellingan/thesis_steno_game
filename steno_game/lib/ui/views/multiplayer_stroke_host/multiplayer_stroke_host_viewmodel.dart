import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
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


  MultiplayerStroke game;
  MultiplayerStrokeHostViewModel(this.game);

  List<QuestionStroke> questions = [];
  List<AnswerStroke> answers = [];
  List<Student> students = [];
  StreamSubscription<List<AnswerStroke>>? streamSubscription;

  init() async {
    setBusy(true);
    final getQuestions = await _multiStroke.getQuestion(game.id);
    getQuestions.fold((l) => showBottomSheet(l.message), (questionsData){
      questions = questionsData;
    });
    final getStudents = await _multiStroke.getStudents(game.id);
    getStudents.fold((l) => showBottomSheet(l.message), (r) {
      students = r;
    });
    streamSubscription = _multiStroke.streamAnswers(game.id).listen((answersData) {
      answers = answersData;
      rebuildUi();
    });
    rebuildUi();
    setBusy(false);
  }

  Student getPlayer(String id) {
    return students.where((student) => student.id == id).first;
  }

  List<AnswerStroke> findQuestionAnswer(String questionId) {
    return answers.where((answers) => answers.questionId == questionId).toList();
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
