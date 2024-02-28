import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:steno_game/exception/game_exception.dart';
import 'package:steno_game/model/lesson.dart';

class LessonRepository {
  final _db = FirebaseFirestore.instance;

  Future<Either<GameException, List<Lesson>>> getLessons(String type) async {
    try {
      final results = await _db
          .collection("lessons")
          .where("type", isEqualTo: type)
          .orderBy("title")
          .get()
          .then((value) =>
              value.docs.map((e) => Lesson.fromJson(e.data())).toList());
      return Right(results);
    } catch (e) {
      print(e.toString());
      return Left(GameException(e.toString()));
    }
  }
}
