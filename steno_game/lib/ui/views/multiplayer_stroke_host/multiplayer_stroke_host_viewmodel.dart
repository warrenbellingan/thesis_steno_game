import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:steno_game/model/multiplayer_stroke.dart';
import 'package:steno_game/model/s_stroke.dart';
import 'package:steno_game/model/s_text.dart';
import 'package:steno_game/model/user.dart';
import 'package:steno_game/repository/stroke_repository.dart';
import '../../../app/app.bottomsheets.dart';
import '../../../app/app.locator.dart';
import '../../../model/student.dart';
import '../../../repository/multiplayer_stroke_repository.dart';
import '../../../services/shared_preference_service.dart';

class MultiplayerStrokeHostViewModel extends BaseViewModel {
  final _multiStrokeRepo = locator<MultiplayerStrokeRepository>();
  final _strokeRepo = locator<StrokeRepository>();
  final _sharedPref = locator<SharedPreferenceService>();
  final _bottomSheet = locator<BottomSheetService>();

  StreamSubscription<List<Student>>? studentsStream;
  StreamSubscription<List<SStroke>>? sStrokeStream;
  StreamSubscription<List<SText>>? sTextStream;
  StreamSubscription<MultiplayerStroke>? gameStream;

  GlobalKey painterKey = GlobalKey();
  late User user;

  List<Student> students = [];
  List<SStroke> sStroke = [];
  List<SText> sText = [];

  MultiplayerStroke game;

  TextEditingController textController = TextEditingController();
  TextEditingController strokeController = TextEditingController();
  int gameStatus = 0;
  int gameType = 0;

  MultiplayerStrokeHostViewModel(this.game);

  init() async {
    setBusy(true);
    user = (await _sharedPref.getCurrentUser())!;
    studentsStream =
        _multiStrokeRepo.streamStudents(game.id).listen((studentsData) {
      students = studentsData;
      rebuildUi();
    });
    gameStream =
        _multiStrokeRepo.streamMultiplayerStroke(game.id).listen((gameData) {
      game = gameData;
      rebuildUi();
    });
    sStrokeStream =
        _multiStrokeRepo.streamSStroke(game.id).listen((sStrokeData) {
      sStroke = sStrokeData;
      rebuildUi();
    });
    sTextStream = _multiStrokeRepo.streamSText(game.id).listen((sTextData) {
      sText = sTextData;
      rebuildUi();
    });
    setBusy(false);
  }

  String? getStudentName(String id) {
    for (Student student in students) {
      if (student.id == id) return student.name;
    }
    return null;
  }

  Future<void> submitStrokeClick() async {
    setBusy(true);
    final uploadStroke =
        await _strokeRepo.addStroke(painterKey, strokeController.text, 1);
    uploadStroke.fold((l) => showBottomSheet(l.message), (stroke) async {
      final response =
          await _multiStrokeRepo.addHostStroke(game.id, stroke.strokeImage);
      response.fold((l) => showBottomSheet(l.message), (r) async {
        strokeController.clear();
        final setType = await _multiStrokeRepo.setGameType(game.id, "stroke");
        setType.fold((l) => showBottomSheet(l.message), (r) async {
          showBottomSheet("Submitted Successfully");
          final getGame = await _multiStrokeRepo.getGame(game.id);
          getGame.fold((l) => showBottomSheet(l.message), (gameData) {
            game = gameData;
            gameStatus = 3;
            gameType = 0;
            rebuildUi();
          });
        });
      });
    });
    rebuildUi();
    setBusy(false);
  }

  Future<void> submitTextClick() async {
    setBusy(true);
    final response =
        await _multiStrokeRepo.addHostText(game.id, textController.text);
    response.fold((l) => showBottomSheet(l.message), (r) async {
      final setType = await _multiStrokeRepo.setGameType(game.id, "stroke");
      setType.fold((l) => showBottomSheet(l.message), (r) async {
        showBottomSheet("Submitted Successfully");
        final getGame = await _multiStrokeRepo.getGame(game.id);
        getGame.fold((l) => showBottomSheet(l.message), (gameData) {
          game = gameData;
          gameStatus = 3;
          gameType = 1;
          rebuildUi();
        });
      });
      showBottomSheet("Submitted Successfully");
    });
    setBusy(false);
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

  @override
  void dispose() {
    studentsStream?.cancel();
    gameStream?.cancel();
    sTextStream?.cancel();
    sStrokeStream?.cancel();
    super.dispose();
  }
}
