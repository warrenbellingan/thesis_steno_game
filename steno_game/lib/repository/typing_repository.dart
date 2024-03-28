import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:steno_game/model/typing.dart';

import '../exception/game_exception.dart';

class TypingRepository {
  final _db = FirebaseFirestore.instance;
  final List<String> vowels = ['A', 'E', 'I', 'O', 'U'];

  Future<Either<GameException, None>> editTyping(Typing typing) async {
    try {
      final typingKeys =
          formatTypingKeys(typing.typingKeys.toUpperCase().trim());
      typing = Typing(id: typing.id, text: typing.text, typingKeys: typingKeys);
      await _db.collection('typing').doc(typing.id).set(typing.toJson());
      return const Right(None());
    } catch (e) {
      return Left(GameException(e.toString()));
    }
  }

  Future<Either<GameException, None>> addTyping(
      String text, String typingKeys) async {
    try {
      final id = DateTime.now().millisecondsSinceEpoch.toString();
      typingKeys = formatTypingKeys(typingKeys.toUpperCase().trim());

      Typing typing = Typing(id: id, text: text, typingKeys: typingKeys);
      await _db.collection('typing').doc(id).set(typing.toJson());
      return const Right(None());
    } catch (e) {
      return Left(GameException(e.toString()));
    }
  }

  Future<Either<GameException, List<Typing>>> searchTyping(
      String searchText) async {
    try {
      final results = await _db.collection('typing').get().then((value) =>
          value.docs.map((doc) => Typing.fromJson(doc.data())).toList());
      if (searchText.isNotEmpty) {
        return Right(results
            .where((typing) => typing.text
                .toLowerCase()
                .contains(searchText.toString().toLowerCase()))
            .toList());
      }
      return Right(results);
    } catch (e) {
      return Left(GameException(e.toString()));
    }
  }

  String formatTypingKeys(String typingKeys) {
    String formattedKeys = "";
    bool isLastConsonant = false;
    for (String key in typingKeys.split('')) {
      if (vowels.contains(key)) {
        isLastConsonant = true;
        formattedKeys += key.toUpperCase();
      } else if (isLastConsonant) {
        formattedKeys += key.toLowerCase();
      } else {
        formattedKeys += key.toUpperCase();
      }
    }
    return formattedKeys;
  }
}
