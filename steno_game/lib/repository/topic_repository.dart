import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:steno_game/app/app.locator.dart';
import 'package:steno_game/exception/game_exception.dart';
import 'package:steno_game/model/picture_topic.dart';
import 'package:steno_game/repository/stroke_repository.dart';

class TopicRepository {
  final _db = FirebaseFirestore.instance;
  final _strokeRepo = locator<StrokeRepository>();

  Future<Either<GameException, None>> addPictureTopic(String lessonId, String description, String text, GlobalKey painterKey) async{
    try{
      final addStrokeResponse = await _strokeRepo.addStroke(painterKey, text, 1, null);
      return addStrokeResponse.fold((l) =>  Left(GameException(l.message)), (stroke) async{
        final id = DateTime.now().millisecondsSinceEpoch.toString();
        PictureTopic picTop = PictureTopic(id: id, stroke: stroke.id, description: description);
        await _db.collection("lessons").doc(lessonId).collection("topics").doc(id).set(picTop.toJson());
        return const Right(None());
      });
    }
    catch(e) {
      return Left(GameException(e.toString()));
    }
  }
  Future<Either<GameException, None>> updatePictureTopic(PictureTopic topic, String lessonId) async{
    try{
      await _db.collection('lessons').doc(lessonId).collection('topics').doc(topic.id).set(topic.toJson());
      return const Right(None());
    }
    catch(e) {
      return Left(GameException(e.toString()));
    }
  }

  Future<Either<GameException, List<PictureTopic>>> getPictureTopics(
      String lessonId,) async {
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
