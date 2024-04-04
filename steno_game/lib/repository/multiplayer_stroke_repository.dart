import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:steno_game/model/answer_stroke.dart';
import 'package:steno_game/model/question_stroke.dart';
import 'package:steno_game/model/student.dart';
import '../app/app.locator.dart';
import '../exception/game_exception.dart';
import '../model/multiplayer_stroke.dart';
import '../services/internet_service.dart';
import '../services/shared_preference_service.dart';

class MultiplayerStrokeRepository {
  final _db = FirebaseFirestore.instance;
  final _sharedPref = locator<SharedPreferenceService>();
  final _internetService = locator<InternetService>();

  Stream<List<Student>> streamStudents(String gameHostId) {
    final results = _db
        .collection("strokeGameEnvironment")
        .doc(gameHostId)
        .collection("students")
        .orderBy("score", descending: true)
        .snapshots();
    return results.map((snapshots) =>
        snapshots.docs.map((doc) => Student.fromJson(doc.data())).toList());
  }

  Stream<List<AnswerStroke>> streamAnswers(String gameHostId) {
    final results = _db
        .collection("strokeGameEnvironment")
        .doc(gameHostId)
        .collection("answers")
        .snapshots();
    return results.map((snapshots) => snapshots.docs
        .map((doc) => AnswerStroke.fromJson(doc.data()))
        .toList());
  }

  Stream<MultiplayerStroke> streamMultiplayerStroke(String gameHostId) {
    final result =
        _db.collection("strokeGameEnvironment").doc(gameHostId).snapshots();
    return result.map((doc) => MultiplayerStroke.fromJson(doc.data()!));
  }

  Future<Either<GameException, None>> addCorrectAnswers(
      String gameId, List<String> correctAnswers) async {
    final bool hasInternet = await _internetService.hasInternetConnection();
    if (hasInternet) {
      try {
        await _db
            .collection("strokeGameEnvironment")
            .doc(gameId)
            .set({"correctAnswers": correctAnswers}, SetOptions(merge: true));
        return const Right(None());
      } catch (e) {
        return Left(GameException(e.toString()));
      }
    } else {
      return Left(GameException("Please check your internet connection!"));
    }
  }

  Future<Either<GameException, None>> addAnswer(String gameId, String data,
      String? strokeId, String questionId, String userId) async {
    final bool hasInternet = await _internetService.hasInternetConnection();
    if (hasInternet) {
      try {
        final user = await _sharedPref.getCurrentUser();
        final id = DateTime.now().millisecondsSinceEpoch.toString() + user!.id;
        AnswerStroke answer = AnswerStroke(
            id: id,
            questionId: questionId,
            data: data,
            stroke: strokeId,
            userId: userId);
        await _db
            .collection("strokeGameEnvironment")
            .doc(gameId)
            .collection('answers')
            .doc(id)
            .set(answer.toJson());
        return const Right(None());
      } catch (e) {
        return Left(GameException(e.toString()));
      }
    } else {
      return Left(GameException("Please check your internet connection!"));
    }
  }

  Future<Either<GameException, List<Student>>> getStudents(
      String gameId) async {
    final bool hasInternet = await _internetService.hasInternetConnection();
    if (hasInternet) {
      try {
        final results = await _db
            .collection("strokeGameEnvironment")
            .doc(gameId)
            .collection('students')
            .orderBy("score", descending: true)
            .get()
            .then((value) =>
                value.docs.map((doc) => Student.fromJson(doc.data())).toList());
        return Right(results);
      } catch (e) {
        return Left(GameException(e.toString()));
      }
    } else {
      return Left(GameException("Please check your internet connection!"));
    }
  }

  Future<Either<GameException, None>> setGameStatus(
      String gameId, int status) async {
    final bool hasInternet = await _internetService.hasInternetConnection();
    if (hasInternet) {
      try {
        await _db
            .collection("strokeGameEnvironment")
            .doc(gameId)
            .set({"status": status}, SetOptions(merge: true));
        return const Right(None());
      } catch (e) {
        return Left(GameException(e.toString()));
      }
    } else {
      return Left(GameException("Please check your internet connection!"));
    }
  }

  Future<Either<GameException, None>> joinGame(String gameId) async {
    final bool hasInternet = await _internetService.hasInternetConnection();
    if (hasInternet) {
      try {
        final getUser = await _sharedPref.getCurrentUser();
        if (getUser != null) {
          final student =
              Student(id: getUser.id, name: getUser.name, image: getUser.image);
          await _db
              .collection("strokeGameEnvironment")
              .doc(gameId)
              .collection("students")
              .doc(student.id)
              .set(student.toJson());
          return const Right(None());
        } else {
          return Left(GameException("Current User not found"));
        }
      } catch (e) {
        return Left(GameException(e.toString()));
      }
    } else {
      return Left(GameException("Please check your internet connection!"));
    }
  }

  Future<Either<GameException, List<MultiplayerStroke>>> searchGame(
      String text) async {
    final bool hasInternet = await _internetService.hasInternetConnection();
    if (hasInternet) {
      try {
        final results = await _db
            .collection('strokeGameEnvironment')
            .where("status", isEqualTo: 1)
            .get()
            .then((value) => value.docs
                .map((doc) => MultiplayerStroke.fromJson(doc.data()))
                .toList());
        if (text.isNotEmpty) {
          return Right(
              results.where((game) => game.id.contains(text)).toList());
        }
        return Right(results);
      } catch (e) {
        return Left(GameException(e.toString()));
      }
    } else {
      return Left(GameException("Please check your internet connection!"));
    }
  }

  Future<Either<GameException, List<AnswerStroke>>> getAnswers(
      String gameId) async {
    final bool hasInternet = await _internetService.hasInternetConnection();
    if (hasInternet) {
      try {
        final results = await _db
            .collection('strokeGameEnvironment')
            .doc(gameId)
            .collection("answers")
            .get()
            .then((value) => value.docs
                .map((doc) => AnswerStroke.fromJson(doc.data()))
                .toList());
        return Right(results);
      } catch (e) {
        return Left(GameException(e.toString()));
      }
    } else {
      return Left(GameException("Please check your internet connection!"));
    }
  }

  Future<Either<GameException, List<QuestionStroke>>> getQuestion(
      String gameId) async {
    final bool hasInternet = await _internetService.hasInternetConnection();
    if (hasInternet) {
      try {
        final results = await _db
            .collection('strokeGameEnvironment')
            .doc(gameId)
            .collection("questions")
            .get()
            .then((value) => value.docs
                .map((doc) => QuestionStroke.fromJson(doc.data()))
                .toList());

        return Right(results);
      } catch (e) {
        return Left(GameException(e.toString()));
      }
    } else {
      return Left(GameException("Please check your internet connection!"));
    }
  }

  Future<Either<GameException, QuestionStroke>> addQuestion(
      String gameId, String data, String type) async {
    final bool hasInternet = await _internetService.hasInternetConnection();
    if (hasInternet) {
      try {
        final id = DateTime.now().millisecondsSinceEpoch.toString();
        QuestionStroke question =
            QuestionStroke(id: id, data: data, type: type);
        await _db
            .collection("strokeGameEnvironment")
            .doc(gameId)
            .collection("questions")
            .doc(id)
            .set(question.toJson());
        return Right(question);
      } catch (e) {
        return Left(GameException(e.toString()));
      }
    } else {
      return Left(GameException("Please check your internet connection!"));
    }
  }

  Future<Either<GameException, MultiplayerStroke>> createGame(
      String gameMasterId) async {
    final bool hasInternet = await _internetService.hasInternetConnection();
    if (hasInternet) {
      try {
        String id = generateId();
        MultiplayerStroke game =
            MultiplayerStroke(id: id, gameMaster: gameMasterId);
        await _db
            .collection("strokeGameEnvironment")
            .doc(id)
            .set(game.toJson());
        return Right(game);
      } catch (e) {
        return Left(GameException(e.toString()));
      }
    } else {
      return Left(GameException("Please check your internet connection!"));
    }
  }

  Future<Either<GameException, MultiplayerStroke>> getGame(
      String gameId) async {
    final bool hasInternet = await _internetService.hasInternetConnection();
    if (hasInternet) {
      try {
        final result =
            await _db.collection("strokeGameEnvironment").doc(gameId).get();
        return Right(MultiplayerStroke.fromJson(result.data()!));
      } catch (e) {
        return Left(GameException(e.toString()));
      }
    } else {
      return Left(GameException("Please check your internet connection!"));
    }
  }

  String generateId() {
    List<String> characters = [
      'a',
      'b',
      'c',
      'd',
      'e',
      'f',
      'g',
      'h',
      'i',
      'j',
      'k',
      'l',
      'm',
      'n',
      'p',
      'q',
      'r',
      's',
      't',
      'u',
      'v',
      'w',
      'x',
      'y',
      'z',
      '0',
      '1',
      '2',
      '3',
      '4',
      '5',
      '6',
      '7',
      '8',
      '9'
    ];

    String id = '';
    Random random = Random();
    int rIndex = random.nextInt(3);

    for (int i = 0; i < 8 + rIndex; i++) {
      int randomIndex = random.nextInt(characters.length);
      characters.shuffle();
      id += characters[randomIndex];
    }
    return id;
  }
}
