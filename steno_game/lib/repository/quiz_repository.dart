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

  Future<Either<GameException, None>> deleteQuiz(String quizId) async {
    final bool hasInternet = await _internetService.hasInternetConnection();
    if (hasInternet) {
      try {
        await _db
            .collection("quizzes")
            .doc(quizId).delete();
        return const Right(None());
      } catch (e) {
        return Left(GameException(e.toString()));
      }
    } else {
      return Left(GameException("Please check your internet connection!"));
    }
  }

  Future<Either<GameException, None>> addQuiz(String quizId, String stroke, List<String> choices, String answer) async {
    final bool hasInternet = await _internetService.hasInternetConnection();
    if (hasInternet) {
      try {
        final id = DateTime.now().millisecondsSinceEpoch.toString();
        Quiz quiz = Quiz(id: id, stroke: stroke, choices: choices, answer: answer);
        await _db
            .collection("quizzes")
            .doc(quizId)
            .collection('quiz').doc(id).set(quiz.toJson());
        return const Right(None());
      } catch (e) {
        return Left(GameException(e.toString()));
      }
    } else {
      return Left(GameException("Please check your internet connection!"));
    }
  }
  Future<Either<GameException, None>> updateQuiz(String quizId, String id, String stroke, List<String> choices, String answer) async {
    final bool hasInternet = await _internetService.hasInternetConnection();
    if (hasInternet) {
      try {
        Quiz quiz = Quiz(id: id, stroke: stroke, choices: choices, answer: answer);
        await _db
            .collection("quizzes")
            .doc(quizId)
            .collection('quiz').doc(id).set(quiz.toJson());
        return const Right(None());
      } catch (e) {
        return Left(GameException(e.toString()));
      }
    } else {
      return Left(GameException("Please check your internet connection!"));
    }
  }

  Future<Either<GameException, Quizzes>> addQuizzes(String title) async {
    final bool hasInternet = await _internetService.hasInternetConnection();
    if (hasInternet) {
      try {
        final id = DateTime.now().millisecondsSinceEpoch.toString();
        Quizzes quiz = Quizzes(id: id, title: title);
        await _db.collection("quizzes").doc(id).set(quiz.toJson());
        return Right(quiz);
      } catch (e) {
        return Left(GameException(e.toString()));
      }
    } else {
      return Left(GameException("Please check your internet connection!"));
    }
  }
  Future<Either<GameException, Quizzes>> updateQuizzes(String quizId, String title) async {
    final bool hasInternet = await _internetService.hasInternetConnection();
    if (hasInternet) {
      try {
        Quizzes quiz = Quizzes(id: quizId, title: title);
        await _db.collection("quizzes").doc(quizId).set(quiz.toJson());
        return Right(quiz);
      } catch (e) {
        return Left(GameException(e.toString()));
      }
    } else {
      return Left(GameException("Please check your internet connection!"));
    }
  }
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
