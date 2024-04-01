import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:steno_game/exception/game_exception.dart';
import 'package:steno_game/model/lesson.dart';

import '../app/app.locator.dart';
import '../services/internet_service.dart';

class LessonRepository {
  final _db = FirebaseFirestore.instance;
  final _internetService = locator<InternetService>();


  Future<Either<GameException, Lesson>> addLesson(
      String title, String type) async {
    final bool hasInternet = await _internetService.hasInternetConnection();
    if(hasInternet){
      try {
        final id = DateTime.now().millisecondsSinceEpoch.toString();
        Lesson lesson = Lesson(id: id, title: title, type: type);
        await _db.collection('lessons').doc(id).set(lesson.toJson());
        return Right(lesson);
      } catch (e) {
        return Left(GameException(e.toString()));
      }
    }
    else {
      return Left(GameException("Please check your internet connection!"));
    }


  }

  Future<Either<GameException, Lesson>> editLesson(
      String id, String title, String type) async {
    final bool hasInternet = await _internetService.hasInternetConnection();
    if(hasInternet){
      try {
        Lesson lesson = Lesson(id: id, title: title, type: type);
        await _db.collection('lessons').doc(id).set(lesson.toJson());
        return Right(lesson);
      } catch (e) {
        return Left(GameException(e.toString()));
      }
    }
    else {
      return Left(GameException("Please check your internet connection!"));
    }


  }

  Future<Either<GameException, None>> deleteLesson(String lessonId) async {
    final bool hasInternet = await _internetService.hasInternetConnection();
    if(hasInternet){
      try {
        await _db.collection('lessons').doc(lessonId).delete();
        return const Right(None());
      } catch (e) {
        return Left(GameException(e.toString()));
      }
    }
    else {
      return Left(GameException("Please check your internet connection!"));
    }
  }

  Future<Either<GameException, List<Lesson>>> getLessons(String type) async {
    final bool hasInternet = await _internetService.hasInternetConnection();
    if(hasInternet){
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
        return Left(GameException(e.toString()));
      }
    }
    else {
      return Left(GameException("Please check your internet connection!"));
    }
  }
}
