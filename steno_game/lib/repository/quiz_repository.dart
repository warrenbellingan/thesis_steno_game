import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:steno_game/app/app.locator.dart';
import 'package:steno_game/services/internet_service.dart';

import '../exception/game_exception.dart';
import '../model/quiz.dart';
import '../model/quizzes.dart';

class QuizRepository {
  final _db = FirebaseFirestore.instance;
  final _internetService = locator<InternetService>();

  Future<Either<GameException, List<Quizzes>>> getQuizzes() async {
    final bool hasInternet = await _internetService.hasInternetConnection();
    if (hasInternet) {
      try {
        final results = await _db.collection("quizzes").get().then((value) =>
            value.docs.map((e) => Quizzes.fromJson(e.data())).toList());
        return Right(results);
      } catch (e) {
        return Left(GameException(e.toString()));
      }
    } else {
      return Left(GameException("Please check your internet connection!"));
    }
  }

  Future<Either<GameException, List<Quiz>>> getQuiz(String quizId) async {
    final bool hasInternet = await _internetService.hasInternetConnection();
    if (hasInternet) {
      try {
        final results = await _db
            .collection("quizzes")
            .doc(quizId)
            .collection('quiz')
            .get()
            .then((value) =>
                value.docs.map((e) => Quiz.fromJson(e.data())).toList());
        return Right(results);
      } catch (e) {
        return Left(GameException(e.toString()));
      }
    } else {
      return Left(GameException("Please check your internet connection!"));
    }
  }
}
