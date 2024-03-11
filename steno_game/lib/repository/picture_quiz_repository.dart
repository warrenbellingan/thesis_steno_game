import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:steno_game/exception/game_exception.dart';
import 'package:steno_game/model/picture_quiz.dart';

class PictureQuizRepository {
  final _db = FirebaseFirestore.instance;

  Future<Either<GameException, PictureQuiz>> getQuiz(String quizId) async {
    try {
      final result = await _db.collection('strokeQuizzes').doc(quizId).get();
      PictureQuiz pictureQuiz = PictureQuiz.fromJson(result.data()!);
      return Right(pictureQuiz);
    } catch (e) {
      return Left(GameException(e.toString()));
    }
  }
}
