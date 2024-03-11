import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:steno_game/exception/game_exception.dart';
import 'package:steno_game/model/picture_topic.dart';

class TopicRepository {
  final _db = FirebaseFirestore.instance;

  Future<Either<GameException, List<PictureTopic>>> getTopics(
      String lessonId) async {
    try {
      final results = await _db
          .collection("lessons")
          .doc(lessonId)
          .collection("topics")
          .get()
          .then((value) =>
              value.docs.map((e) => PictureTopic.fromJson(e.data())).toList());
      return Right(results);
    } catch (e) {
      return Left(GameException(e.toString()));
    }
  }
}
