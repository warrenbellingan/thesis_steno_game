import 'dart:async';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:steno_game/app/app.locator.dart';
import 'package:steno_game/model/answer_stroke.dart';
import 'package:steno_game/repository/multiplayer_stroke_repository.dart';
import '../../../app/app.bottomsheets.dart';
import '../../../model/multiplayer_stroke.dart';
import '../../../model/student.dart';

class MultiplayerStrokeHostResultsViewModel extends BaseViewModel {
  final _multiRepo = locator<MultiplayerStrokeRepository>();
  final _bottomSheet = locator<BottomSheetService>();
  final _nav = locator<NavigationService>();

  List<AnswerStroke> answers = [];
  List<Student> students = [];
  StreamSubscription<List<Student>>? streamSubscription;

  MultiplayerStroke game;
  MultiplayerStrokeHostResultsViewModel(this.game);

  init() async {
    setBusy(true);
    final getStudents = await _multiRepo.getStudents(game.id);
    getStudents.fold((l) => showBottomSheet(l.message), (r) {
      students = r;
    });
    streamSubscription =
        _multiRepo.streamStudents(game.id).listen((studentsData) {
      students = studentsData;
      rebuildUi();
    });
    final getAnswers = await _multiRepo.getAnswers(game.id);
    getAnswers.fold((l) => showBottomSheet(l.message), (r) {
      answers = r;
    });

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

  @override
  void dispose() {
    streamSubscription?.cancel();
    super.dispose();
  }
}
