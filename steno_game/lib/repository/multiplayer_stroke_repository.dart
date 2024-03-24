import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:steno_game/model/student.dart';
import '../app/app.locator.dart';
import '../exception/game_exception.dart';
import '../model/multiplayer_stroke.dart';
import '../services/shared_preference_service.dart';

class MultiplayerStrokeRepository {
  final _db = FirebaseFirestore.instance;
  final _sharedPref = locator<SharedPreferenceService>();

  Stream<List<Student>> streamStudents(String gameHostId) {
    final results = _db
        .collection("strokeGameEnvironment")
        .doc(gameHostId)
        .collection("students")
        .snapshots();
    return results.map((snapshots) =>
        snapshots.docs.map((doc) => Student.fromJson(doc.data())).toList());
  }

  Stream<MultiplayerStroke> streamMultiplayerStroke(String gameHostId) {
    final result =
        _db.collection("strokeGameEnvironment").doc(gameHostId).snapshots();
    return result.map((doc) => MultiplayerStroke.fromJson(doc.data()!));
  }

  Future<Either<GameException, None>> startGame(String gameId) async {
    try {
      await _db
          .collection("strokeGameEnvironment")
          .doc(gameId)
          .set({"status": 1}, SetOptions(merge: true));
      return const Right(None());
    } catch (e) {
      return Left(GameException(e.toString()));
    }
  }

  Future<Either<GameException, None>> joinGame(String gameId) async {
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
  }

  Future<Either<GameException, List<MultiplayerStroke>>> searchGame(
      String text) async {
    try {
      final results = await _db.collection('strokeGameEnvironment').get().then(
          (value) => value.docs
              .map((doc) => MultiplayerStroke.fromJson(doc.data()))
              .toList());
      if (text.isNotEmpty) {
        return Right(results.where((game) => game.id.contains(text)).toList());
      }
      return Right(results);
    } catch (e) {
      return Left(GameException(e.toString()));
    }
  }

  Future<Either<GameException, String>> createGame(String gameMasterId) async {
    try {
      String id = generateId();
      MultiplayerStroke game =
          MultiplayerStroke(id: id, gameMaster: gameMasterId);
      await _db.collection("strokeGameEnvironment").doc(id).set(game.toJson());
      return Right(id);
    } catch (e) {
      return Left(GameException(e.toString()));
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
