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
  Set<String> correctAnswers = {};
  Set<String> wrongAnswers = {};

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
  }
}
