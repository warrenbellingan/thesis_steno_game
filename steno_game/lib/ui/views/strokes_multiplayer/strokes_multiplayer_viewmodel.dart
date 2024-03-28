import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:steno_game/app/app.bottomsheets.dart';
import 'package:steno_game/model/user.dart';
import 'package:steno_game/services/shared_preference_service.dart';
import '../../../app/app.locator.dart';
import '../../../model/multiplayer_stroke.dart';
import '../../../model/student.dart';
import '../../../repository/multiplayer_stroke_repository.dart';
import '../../../repository/stroke_repository.dart';

class StrokesMultiplayerViewModel extends BaseViewModel {
  final GlobalKey painterKey = GlobalKey();

  final _multiStrokeRepo = locator<MultiplayerStrokeRepository>();
  final _strokeRepo = locator<StrokeRepository>();
  final _showBottomSheetServ = locator<BottomSheetService>();
  final _sharedPref = locator<SharedPreferenceService>();

  StreamSubscription<List<Student>>? studentsStream;
  StreamSubscription<MultiplayerStroke>? gameStream;

  List<Student> students = [];

  late User user;

  int gameStatus = 0;

  String waitingText = "The game master is preparing. Please wait";

  MultiplayerStroke game;
  TextEditingController textController = TextEditingController();

  StrokesMultiplayerViewModel(this.game);

  init() async {
    setBusy(true);
    user = (await _sharedPref.getCurrentUser())!;
    final getStudents = await _multiStrokeRepo.getStudents(game.id);
    getStudents.fold((l) => showBottomSheet(l.message),
        (studentsData) => students = studentsData);
    studentsStream =
        _multiStrokeRepo.streamStudents(game.id).listen((studentsData) {
      students = studentsData;
      rebuildUi();
    });
    gameStream =
        _multiStrokeRepo.streamMultiplayerStroke(game.id).listen((gameData) {
      game = gameData;
      if (gameStatus == 0 && game.type != "") {
        waitingText = "Done, Please click the next button";
      }
      rebuildUi();
    });
    rebuildUi();
    setBusy(false);
  }

  void nextClick() {
    if (game.type == "stroke") {
      gameStatus = 1;
    } else if (game.type == "text") {
      gameStatus = 2;
    } else {
      showBottomSheet("Something went wrong. Please try again");
    }
    rebuildUi();
  }

  Future<void> submitText() async {
    setBusy(true);
    final response =
        await _multiStrokeRepo.addSText(game.id, textController.text);
    response.fold((l) => showBottomSheet(l.message), (r) {
      textController.clear();
      rebuildUi();
      showBottomSheet("Text submitted successfully");
    });
    setBusy(false);
  }

  Future<void> submitImage() async {
    setBusy(true);
    final response = await _strokeRepo.addStroke(painterKey, game.text, 0);
    response.fold((l) {
      showBottomSheet(l.message);
    }, (strokeImage) async {
      final sendImage =
          await _multiStrokeRepo.addSStroke(game.id, strokeImage.strokeImage);
      sendImage.fold((l) => showBottomSheet(l.message), (r) {
        showBottomSheet("Submitted Successfully");
      });
    });
    setBusy(false);
  }

  void showBottomSheet(String description) {
    _showBottomSheetServ.showCustomSheet(
      variant: BottomSheetType.notice,
      title: "Notice",
      description: description,
    );
  }

  @override
  void dispose() {
    studentsStream?.cancel();
    gameStream?.cancel();
    super.dispose();
  }
}
