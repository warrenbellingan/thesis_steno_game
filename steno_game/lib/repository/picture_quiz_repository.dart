import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:steno_game/exception/game_exception.dart';
import 'package:steno_game/model/picture_quiz.dart';

import '../app/app.locator.dart';
import '../services/internet_service.dart';

class PictureQuizRepository {
  final _db = FirebaseFirestore.instance;
  final _internetService = locator<InternetService>();

  Future<Either<GameException, PictureQuiz>> getQuiz(String quizId) async {
    final bool hasInternet = await _internetService.hasInternetConnection();
    if (hasInternet) {
      try {
        final result = await _db.collection('strokeQuizzes').doc(quizId).get();
        PictureQuiz pictureQuiz = PictureQuiz.fromJson(result.data()!);
        return Right(pictureQuiz);
      } catch (e) {
        return Left(GameException(e.toString()));
      }
    } else {
      return Left(GameException("Please check your internet connection!"));
    }
  }
}
