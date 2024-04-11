import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:steno_game/app/app.bottomsheets.dart';
import 'package:steno_game/app/app.locator.dart';
import 'package:steno_game/app/app.router.dart';
import 'package:steno_game/model/question_stroke.dart';
import 'package:steno_game/repository/stroke_repository.dart';
import '../../../model/multiplayer_stroke.dart';
import '../../../repository/multiplayer_stroke_repository.dart';

class HostStrokeViewModel extends BaseViewModel {
  final _multiStrokeRepo = locator<MultiplayerStrokeRepository>();
  final _strokeRepo = locator<StrokeRepository>();
  final _bottomSheet = locator<BottomSheetService>();
  final _navigation = locator<NavigationService>();

  int currentPage = 0;
  List<QuestionStroke> questions = [];
  GlobalKey painterKey = GlobalKey();

  bool isEditingQuiz = false;
  bool showQuizType = false;
  bool isEditingMode = false;
  int editingType = 0;
  MultiplayerStroke game;

  TextEditingController textController = TextEditingController();

  PageController pageController = PageController();
  HostStrokeViewModel(this.game);

  void addQuiz() async {
    if(textController.text.isEmpty) {
      showBottomSheet("The Stroke Word is  Empty!");
    }
    else if (editingType == 0) {
      await _addStrokeQuiz();
    } else if (editingType == 1) {
      await _addTextQuiz();
    }
  }

void setIsEditingQuiz(String? label) {
    isEditingQuiz = !isEditingQuiz;
    if(label != null) textController.text = label;
    rebuildUi();
}
  void deleteQuiz(QuestionStroke quiz) async{
    setBusy(true);
    final response = await _multiStrokeRepo.deleteQuestion(game.id,quiz.id);
    response.fold((l) => showBottomSheet(l.message), (r) {
      questions.remove(quiz);
      if(questions.isNotEmpty) currentPage--;
      rebuildUi();
    });
    setBusy(false);
  }
  Future<void> _addStrokeQuiz() async {

    setBusyForObject("addEditQuiz", true);
    final addStrokeResponse =
        await _strokeRepo.addStroke(painterKey, "(Add text)", 0, null);
    addStrokeResponse.fold((l) {
      showBottomSheet(l.message);
    }, (stroke) async {
      final response = await _multiStrokeRepo.addQuestion(
          game.id, stroke.strokeImage, "stroke", textController.text);
      response.fold((l) => showBottomSheet(l.message), (quiz) {
        questions.add(quiz);
        cancelAdd();
        rebuildUi();
      });
    });

    setBusyForObject("addEditQuiz", false);
  }
  void updateStrokeQuestion(QuestionStroke quiz, int index) async {
    setBusyForObject("isUpdating", true);
    final addStrokeResponse =
    await _strokeRepo.addStroke(painterKey, "(Add text)", 0, null);
    addStrokeResponse.fold((l) {
      showBottomSheet(l.message);
    }, (stroke) async {
      final response = await _multiStrokeRepo.updateQuestion(game.id, quiz.id, stroke.strokeImage, "stroke", textController.text);
      response.fold((l) => showBottomSheet(l.message), (newQuiz) {
        questions.remove(quiz);
        questions.insert(index, newQuiz);
        setIsEditingQuiz(null);
        rebuildUi();
      });
    });
    setBusyForObject("isUpdating", false);
  }

  Future<void> _addTextQuiz() async {

    setBusyForObject("addEditQuiz", true);
    final response = await _multiStrokeRepo.addQuestion(
        game.id, textController.text, "text", null);
    response.fold((l) => showBottomSheet(l.message), (quiz) {
      questions.add(quiz);
      cancelAdd();
      rebuildUi();
    });

    setBusyForObject("addEditQuiz", false);
  }
  void updateTextQuiz(QuestionStroke quiz, int index) async {
    setBusyForObject("isUpdating", true);
    final response = await _multiStrokeRepo.updateQuestion(
        game.id, quiz.id, textController.text, "text", null);
    response.fold((l) => showBottomSheet(l.message), (newQuiz) {
      questions.remove(quiz);
      questions.insert(index, newQuiz);
      setIsEditingQuiz(null);
      textController.clear();
      rebuildUi();
    });
    setBusyForObject("isUpdating", false);

  }

  void setShowQuizType() {
    showQuizType = true;
    isEditingMode = false;
    rebuildUi();
  }

  void cancelAdd() {
    textController.clear();
    showQuizType = false;
    isEditingMode = false;
    rebuildUi();
  }

  void readyGame() async {
    setBusyForObject("readyGame", true);
    final response = await _multiStrokeRepo.setGameStatus(game.id, 1);
    response.fold((l) => showBottomSheet(l.message), (r) {
      game = MultiplayerStroke(
          id: game.id, gameMaster: game.gameMaster, status: 1);
      _navigation.replaceWithMultiplayerStrokeWaitingRoomView(game: game);
    });
    setBusyForObject("readyGame", false);
  }
  void changePage(int index) {
    currentPage = index;
    rebuildUi();
  }

  void navigatePage(int index) {
    if(index < 0) {
      return;
    }
    if(index > questions.length) {
      return;
    }
    pageController.animateToPage(index, duration: const Duration(milliseconds: 200), curve: Curves.easeInOut);
    if(isEditingQuiz) isEditingQuiz = false;
    rebuildUi();
  }

  void editMode(int type) {
    showQuizType = false;
    editingType = type;
    isEditingMode = true;
    rebuildUi();
  }

  void showBottomSheet(String description) {
    _bottomSheet.showCustomSheet(
      variant: BottomSheetType.notice,
      title: "Notice",
      description: description,
    );
  }
}
