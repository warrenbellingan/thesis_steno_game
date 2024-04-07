import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:steno_game/app/app.locator.dart';
import 'package:steno_game/model/quizzes.dart';
import 'package:steno_game/repository/stroke_repository.dart';

import '../../../app/app.bottomsheets.dart';
import '../../../repository/quiz_repository.dart';

class QuizGameStrokeViewModel extends BaseViewModel {
  final _quizRepo = locator<QuizRepository>();
  final _bottomSheet = locator<BottomSheetService>();

  List<Quizzes> quizzes = [];

  init() async {
    await getQuizzes();
  }

  Future<void> getQuizzes() async {
    setBusy(true);
    final results = await _quizRepo.getQuizzes();
    results.fold((l) => showBottomSheet(l.message), (r) {
      quizzes = r;
      rebuildUi();
    });
    setBusy(false);
  }

  void showBottomSheet(String description) {
    _bottomSheet.showCustomSheet(
      variant: BottomSheetType.notice,
      title: "Notice",
      description: description,
    );
  }
}
