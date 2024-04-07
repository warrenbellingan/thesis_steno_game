import 'package:stacked/stacked.dart';
import 'package:steno_game/app/app.locator.dart';
import 'package:steno_game/model/steno_stroke.dart';
import 'package:steno_game/repository/stroke_repository.dart';

class QuizGameStrokeViewModel extends BaseViewModel {
  final _strokeRepo = locator<StrokeRepository>();


}
