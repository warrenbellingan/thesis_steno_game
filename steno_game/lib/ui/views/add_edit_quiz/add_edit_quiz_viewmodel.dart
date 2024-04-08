import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:steno_game/app/app.locator.dart';
import 'package:steno_game/model/quiz.dart';
import 'package:steno_game/repository/quiz_repository.dart';
import 'package:steno_game/repository/stroke_repository.dart';

import '../../../app/app.bottomsheets.dart';
import '../../../app/app.dialogs.dart';
import '../../../model/quizzes.dart';
import '../../../model/steno_stroke.dart';
import '../../common/temp.dart';

class AddEditQuizViewModel extends BaseViewModel {
  final _bottomSheet = locator<BottomSheetService>();
  final _strokeRepo = locator<StrokeRepository>();
  final _quizRepo = locator<QuizRepository>();
  final _dialogSer = locator<DialogService>();

  GlobalKey painterKey = GlobalKey();

  Quizzes? quizzes;

  AddEditQuizViewModel(this.quizzes);

  StenoStroke? stroke;
  List<Quiz> quiz = [];

  bool isEditing = false;
  int currentPage = 0;

  TextEditingController titleTextController = TextEditingController();

  TextEditingController correctTextController = TextEditingController();
  TextEditingController wrong1TextController = TextEditingController();
  TextEditingController wrong2TextController = TextEditingController();
  TextEditingController wrong3TextController = TextEditingController();

  init() async {
    if (quizzes != null) {
      titleTextController.text = quizzes!.title;
    }
  }

  void addQuiz() async {
    setBusyForObject("saveQuiz", true);
    if (quizzes == null) {
      final response = await _quizRepo.addQuizzes(titleTextController.text);
      response.fold((l) => showBottomSheet(l.message), (r) async {
        quizzes = r;
        await getQuiz();
        isEditing = true;
        rebuildUi();
      });
    } else {
      final response =
          await _quizRepo.updateQuizzes(quizzes!.id, titleTextController.text);
      response.fold((l) => showBottomSheet(l.message), (r) async {
        quizzes = r;
        await getQuiz();
        isEditing = true;
        rebuildUi();
      });
    }
    rebuildUi();
    setBusyForObject("saveQuiz", false);
  }

  Future<void> getStroke() async {
    setBusy(true);
    final response = await _strokeRepo.getStroke(quiz[currentPage].stroke);
    response.fold((l) => showBottomSheet(l.message), (r) {
      stroke = r;
      print(stroke);
    });
    setBusy(false);
  }

  Future<void> getQuiz() async {
    final response = await _quizRepo.getQuiz(quizzes!.id);
    response.fold((l) => showBottomSheet(l.message), (r) async {
      quiz = r;
      if (quiz.isNotEmpty) {
        await getStroke();
        correctTextController.text = quiz[currentPage].answer;
        wrong1TextController.text = quiz[currentPage].choices[1];
        wrong2TextController.text = quiz[currentPage].choices[2];
        wrong3TextController.text = quiz[currentPage].choices[3];
      }
    });
  }

  List<String> getChoices() {
    return [
      correctTextController.text,
      wrong1TextController.text,
      wrong3TextController.text,
      wrong2TextController.text
    ];
  }

  void addQuizzes() async {
    setBusyForObject("add", true);
    final addImage = await _strokeRepo.addStroke(
        painterKey, correctTextController.text, 1, null);
    addImage.fold((l) => showBottomSheet(l.message), (stroke) async {
      final response = await _quizRepo.addQuiz(
          quizzes!.id, stroke.id, getChoices(), correctTextController.text);
      response.fold((l) => l.message, (r) async {
        await getQuiz();
        rebuildUi();
      });
    });
    rebuildUi();
    setBusyForObject("add", false);
  }

  void updateQuizzes() async {
    setBusyForObject("add", true);

    final response = await _quizRepo.updateQuiz(
        quizzes!.id,
        quiz[currentPage].id,
        quiz[currentPage].stroke,
        getChoices(),
        correctTextController.text);
    response.fold((l) => l.message, (r) async {
      await getQuiz();
      rebuildUi();
    });
    rebuildUi();
    setBusyForObject("add", false);
  }

  void changePage(int index) async {
    if (index < 0) {
      return;
    } else if (index > quiz.length) {
      return;
    }
    currentPage = index;
    if (currentPage < quiz.length) {
      await getStroke();
      correctTextController.text = quiz[currentPage].answer;
      wrong1TextController.text = quiz[currentPage].choices[0];
      wrong2TextController.text = quiz[currentPage].choices[1];
      wrong3TextController.text = quiz[currentPage].choices[2];
    } else {
      correctTextController.clear();
      wrong1TextController.clear();
      wrong2TextController.clear();
      wrong3TextController.clear();
    }
    rebuildUi();
  }

  void showBottomSheet(String description) {
    _bottomSheet.showCustomSheet(
      variant: BottomSheetType.notice,
      title: "Notice",
      description: description,
    );
  }

  void editStroke() async {
    Temporary.stroke = stroke;
    await _dialogSer.showCustomDialog(
      variant: DialogType.editStroke,
    );
    await getStroke();
    rebuildUi();
  }
}
