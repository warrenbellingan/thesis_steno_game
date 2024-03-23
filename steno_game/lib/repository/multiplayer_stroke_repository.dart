import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:steno_game/model/student.dart';
import '../exception/game_exception.dart';
import '../model/multiplayer_stroke.dart';

class MultiplayerStrokeRepository {
  final _db = FirebaseFirestore.instance;

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

  Future<Either<GameException, None>> createGame(String gameMasterId) async {
    try {
      String id = generateId();
      MultiplayerStroke game =
          MultiplayerStroke(id: id, gameMaster: gameMasterId);
      await _db.collection("strokeGameEnvironment").doc(id).set(game.toJson());
      return const Right(None());
    } catch (e) {
      return Left(GameException(e.toString()));
    }
  }


  String generateId() {
    List<String> characters = [
      'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm',
      'n', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
      '0', '1', '2', '3', '4', '5', '6', '7', '8', '9'
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
