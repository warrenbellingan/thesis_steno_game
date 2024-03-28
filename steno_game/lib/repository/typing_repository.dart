import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:steno_game/model/typing.dart';

import '../exception/game_exception.dart';

class TypingRepository {
  final _db = FirebaseFirestore.instance;
  Future<Either<GameException, List<Typing>>> searchTyping(
      String searchText) async {
    try {
      final results = await _db.collection('typing').get().then((value) =>
          value.docs.map((doc) => Typing.fromJson(doc.data())).toList());
      if (searchText.isNotEmpty) {
        return Right(results
            .where((stroke) =>
                stroke.text.toLowerCase().contains(searchText.toString()))
            .toList());
      }
      return Right(results);
    } catch (e) {
      return Left(GameException(e.toString()));
    }
  }
}
