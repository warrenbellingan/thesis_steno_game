import 'package:stacked/stacked.dart';
import 'package:steno_game/app/app.locator.dart';
import 'package:steno_game/model/picture_quiz.dart';
import 'package:steno_game/model/steno_stroke.dart';
import 'package:steno_game/repository/picture_quiz_repository.dart';
import 'package:steno_game/repository/stroke_repository.dart';

class QuizGameStrokeViewModel extends BaseViewModel {
  final _picQuizRepo = locator<PictureQuizRepository>();
  final _strokeRepo = locator<StrokeRepository>();

  late PictureQuiz quiz;
  late StenoStroke stroke;

  void init() async {
    await getQuiz();
    await getStroke(quiz.stroke);
  }

  Future<void> getQuiz() async {
    setBusy(true);
    print("Get Quiz");
    final response = await _picQuizRepo.getQuiz("5H4IYRZnMrU7yZu63n5b");
    response.fold((l) => print(l.message), (data) async {
      quiz = data;
    });
    setBusy(false);
  }

  Future<void> getStroke(String id) async {
    setBusy(true);

    print("Get Stroke");
    final response = await _strokeRepo.getStroke(id);
    response.fold((l) => print(l.message), (data) {
      if (data == null) {
        print("null");
      }
      stroke = data;
    });
    setBusy(false);
  }

  void choiceClick(String choiceAnswer) {
    if (choiceAnswer.trim() == quiz.answer.trim()) {
      print("Correct");
    } else {
      print("Wrong");
    }
  }
}
