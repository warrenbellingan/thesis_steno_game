import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:steno_game/app/app.locator.dart';
import 'package:steno_game/model/quiz.dart';
import 'package:steno_game/repository/quiz_repository.dart';
import 'package:steno_game/repository/stroke_repository.dart';

import '../../../app/app.bottomsheets.dart';
import '../../../model/quizzes.dart';

class AddEditQuizViewModel extends BaseViewModel {
  final _bottomSheet = locator<BottomSheetService>();
  final _strokeRepo = locator<StrokeRepository>();
  final _quizRepo = locator<QuizRepository>();


  GlobalKey painterKey = GlobalKey();
  Quizzes? quizzes;
  List<Quiz> quiz = [];
  bool isEditing = false;
  int currentPage = 0;
  TextEditingController titleTextController = TextEditingController();

  TextEditingController correctTextController = TextEditingController();
  TextEditingController wrong1TextController = TextEditingController();
  TextEditingController wrong2TextController = TextEditingController();
  TextEditingController wrong3TextController = TextEditingController();


  void addQuiz() async {
    setBusyForObject("saveQuiz", true);
    final response = await _quizRepo.addQuizzes(titleTextController.text);
    response.fold((l) => showBottomSheet(l.message), (r) async {
      quizzes = r;
      await getQuiz();
      isEditing = true;
      rebuildUi();
    });
    rebuildUi();
    setBusyForObject("saveQuiz", false);
  }

  Future<void> getQuiz() async {
    final response = await _quizRepo.getQuiz(quizzes!.id);
    response.fold((l) => showBottomSheet(l.message), (r) {
      quiz = r;
    });
  }

  void showBottomSheet(String description) {
    _bottomSheet.showCustomSheet(
      variant: BottomSheetType.notice,
      title: "Notice",
      description: description,
    );
  }
}
