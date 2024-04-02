import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:steno_game/app/app.bottomsheets.dart';
import 'package:steno_game/app/app.locator.dart';
import 'package:steno_game/app/app.router.dart';
import 'package:steno_game/model/student.dart';
import 'package:steno_game/services/shared_preference_service.dart';
import '../../../model/multiplayer_stroke.dart';
import '../../../repository/multiplayer_stroke_repository.dart';

class HostStrokeViewModel extends BaseViewModel {

  final _multiStrokeRepo = locator<MultiplayerStrokeRepository>();
  final _bottomSheet = locator<BottomSheetService>();

  bool showQuizType = false;
  bool isEditingMode = false;
  int editingType = 0;
  MultiplayerStroke game;

  TextEditingController textController = TextEditingController();
HostStrokeViewModel(this.game);

  init() async {
    print(game);
  }

  void setShowQuizType() {
    showQuizType = true;
    rebuildUi();
  }

  void editMode(int type){
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
