import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:steno_game/model/multiplayer_stroke.dart';
import 'package:steno_game/repository/stroke_repository.dart';

import '../../../app/app.bottomsheets.dart';
import '../../../app/app.locator.dart';
import '../../../repository/multiplayer_stroke_repository.dart';

class MultiplayerStrokeHostViewModel extends BaseViewModel {

  final _multiStrokeRepo = locator<MultiplayerStrokeRepository>();
  final _strokeRepo = locator<StrokeRepository>();
  final _bottomSheet = locator<BottomSheetService>();


  GlobalKey painterKey = GlobalKey();

  MultiplayerStroke game;


  TextEditingController textController = TextEditingController();
  TextEditingController strokeController = TextEditingController();
  int gameStatus = 0;

  MultiplayerStrokeHostViewModel(this.game);

  init() async {
    setBusy(true);
    setBusy(false);
  }

  Future<void> submitStrokeClick() async {
    setBusy(true);
    final uploadStroke = await _strokeRepo.addStroke(painterKey, strokeController.text, 1);
    uploadStroke.fold((l) => showBottomSheet(l.message), (stroke) async{
      final response = await _multiStrokeRepo.addHostStroke(game.id, stroke.strokeImage);
      response.fold((l) => showBottomSheet(l.message), (r) {
        strokeController.clear();
        showBottomSheet("Submitted Successfully");
      });
    });
    rebuildUi();
    setBusy(false);
  }

  Future<void> submitTextClick() async {
    setBusy(true);
    final response = await _multiStrokeRepo.addHostText(game.id, textController.text);
    response.fold((l) => showBottomSheet(l.message), (r) {
      showBottomSheet("Submitted Successfully");
    });
    setBusy(false);
  }
  void goToCheckingRoom() {

  }
  void selectionClick(int status) {
    gameStatus = status;
    rebuildUi();
  }

  void returnToSelection() {
    gameStatus = 0;
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
