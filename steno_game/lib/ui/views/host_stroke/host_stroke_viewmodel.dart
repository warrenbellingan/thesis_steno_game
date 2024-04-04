import 'dart:async';
import 'package:flutter/cupertino.dart';
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

  List<QuestionStroke> questions = [];
  GlobalKey painterKey = GlobalKey();

  bool showQuizType = false;
  bool isEditingMode = false;
  int editingType = 0;
  MultiplayerStroke game;

  TextEditingController textController = TextEditingController();
  HostStrokeViewModel(this.game);

  init() async {
    print(game);
  }

  void addQuiz() async {
    if (editingType == 0) {
      await addStrokeQuiz();
    } else if (editingType == 1) {
      await addTextQuiz();
    }
  }

  void readyGame() async {
    setBusyForObject("readyGame", true);
    final response = await _multiStrokeRepo.setGameStatus(game.id, 1);
    response.fold((l) => showBottomSheet(l.message), (r) {
      game = MultiplayerStroke(
          id: game.id, gameMaster: game.gameMaster, status: 1);
      _navigation.replaceWithMultiplayerStrokeWaitingRoomView(game: game);
    });
    setBusyForObject("readyGame", false);  }

  Future<void> addStrokeQuiz() async {
    setBusy(true);
    final addStrokeResponse =
        await _strokeRepo.addStroke(painterKey, textController.text, 1, null);
    addStrokeResponse.fold((l) {
      showBottomSheet(l.message);
      print(l.message);
    }, (stroke) async {
      final response = await _multiStrokeRepo.addQuestion(
          game.id, stroke.strokeImage, "stroke");
      response.fold((l) => showBottomSheet(l.message), (quiz) {
        questions.add(quiz);
        cancelAdd();
        rebuildUi();
      });
    });
    setBusy(false);
  }

  Future<void> addTextQuiz() async {
    setBusy(true);
    final response = await _multiStrokeRepo.addQuestion(
        game.id, textController.text, "text");
    response.fold((l) => showBottomSheet(l.message), (quiz) {
      questions.add(quiz);
      cancelAdd();
      rebuildUi();
    });
    setBusy(false);
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
