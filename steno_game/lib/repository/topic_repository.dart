import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:steno_game/app/app.locator.dart';
import 'package:steno_game/exception/game_exception.dart';
import 'package:steno_game/model/picture_topic.dart';
import 'package:steno_game/model/text_topic.dart';
import 'package:steno_game/repository/stroke_repository.dart';

import '../services/internet_service.dart';

class TopicRepository {
  final _db = FirebaseFirestore.instance;
  final _strokeRepo = locator<StrokeRepository>();
  final _internetService = locator<InternetService>();
  Future<Either<GameException, None>> addTextTopic(
      String lessonId, String text) async {
    final bool hasInternet = await _internetService.hasInternetConnection();
    if (hasInternet) {
      try {
        final id = DateTime.now().millisecondsSinceEpoch.toString();
        TextTopic topic = TextTopic(id: id, text: text);
        await _db
            .collection("lessons")
            .doc(lessonId)
            .collection("topics")
            .doc(id)
            .set(topic.toJson());
        return const Right(None());
      } catch (e) {
        return Left(GameException(e.toString()));
      }
    } else {
      return Left(GameException("Please check your internet connection!"));
    }
  }

  Future<Either<GameException, None>> updateTextTopic(
      String lessonId, TextTopic topic) async {
    final bool hasInternet = await _internetService.hasInternetConnection();
    if (hasInternet) {
      try {
        await _db
            .collection("lessons")
            .doc(lessonId)
            .collection("topics")
            .doc(topic.id)
            .set(topic.toJson());
        return const Right(None());
      } catch (e) {
        return Left(GameException(e.toString()));
      }
    } else {
      return Left(GameException("Please check your internet connection!"));
    }
  }

  Future<Either<GameException, List<TextTopic>>> getTextTopic(
      String lessonId) async {
    final bool hasInternet = await _internetService.hasInternetConnection();
    if (hasInternet) {
      try {
        final results = await _db
            .collection('lessons')
            .doc(lessonId)
            .collection('topics')
            .get()
            .then((value) =>
                value.docs.map((e) => TextTopic.fromJson(e.data())).toList());
        return Right(results);
      } catch (e) {
        return Left(GameException(e.toString()));
      }
    } else {
      return Left(GameException("Please check your internet connection!"));
    }
  }

  Future<Either<GameException, None>> addPictureTopic(String lessonId,
      String description, String text, GlobalKey painterKey) async {
    final bool hasInternet = await _internetService.hasInternetConnection();
    if (hasInternet) {
      try {
        final addStrokeResponse =
            await _strokeRepo.addStroke(painterKey, text, 1, null);
        return addStrokeResponse.fold((l) => Left(GameException(l.message)),
            (stroke) async {
          final id = DateTime.now().millisecondsSinceEpoch.toString();
          PictureTopic picTop =
              PictureTopic(id: id, stroke: stroke.id, description: description);
          await _db
              .collection("lessons")
              .doc(lessonId)
              .collection("topics")
              .doc(id)
              .set(picTop.toJson());
          return const Right(None());
        });
      } catch (e) {
        return Left(GameException(e.toString()));
      }
    } else {
      return Left(GameException("Please check your internet connection!"));
    }
  }

  Future<Either<GameException, None>> updatePictureTopic(
      PictureTopic topic, String lessonId) async {
    final bool hasInternet = await _internetService.hasInternetConnection();
    if (hasInternet) {
      try {
        await _db
            .collection('lessons')
            .doc(lessonId)
            .collection('topics')
            .doc(topic.id)
            .set(topic.toJson());
        return const Right(None());
      } catch (e) {
        return Left(GameException(e.toString()));
      }
    } else {
      return Left(GameException("Please check your internet connection!"));
    }
  }

  Future<Either<GameException, List<PictureTopic>>> getPictureTopics(
    String lessonId,
  ) async {
    final bool hasInternet = await _internetService.hasInternetConnection();
    if (hasInternet) {
      try {
        final results = await _db
            .collection("lessons")
            .doc(lessonId)
            .collection("topics")
            .get()
            .then((value) => value.docs
                .map((e) => PictureTopic.fromJson(e.data()))
                .toList());
        return Right(results);
      } catch (e) {
        return Left(GameException(e.toString()));
      }
    } else {
      return Left(GameException("Please check your internet connection!"));
    }
  }
}
