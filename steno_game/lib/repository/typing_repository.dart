import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:steno_game/model/typing.dart';

import '../app/app.locator.dart';
import '../exception/game_exception.dart';
import '../services/internet_service.dart';

class TypingRepository {
  final _db = FirebaseFirestore.instance;
  final _internetService = locator<InternetService>();

  final List<String> vowels = ['A', 'E', 'I', 'O', 'U'];

  Future<Either<GameException, None>> editTyping(Typing typing) async {
    final bool hasInternet = await _internetService.hasInternetConnection();
    if (hasInternet) {
      try {
        final typingKeys =
            formatTypingKeys(typing.typingKeys.toUpperCase().trim());
        typing =
            Typing(id: typing.id, text: typing.text, typingKeys: typingKeys);
        await _db.collection('typing').doc(typing.id).set(typing.toJson());
        return const Right(None());
      } catch (e) {
        return Left(GameException(e.toString()));
      }
    } else {
      return Left(GameException("Please check your internet connection!"));
    }
  }

  Future<Either<GameException, None>> addTyping(
      String text, String typingKeys) async {
    final bool hasInternet = await _internetService.hasInternetConnection();
    if (hasInternet) {
      try {
        final id = DateTime.now().millisecondsSinceEpoch.toString();
        typingKeys = formatTypingKeys(typingKeys.toUpperCase().trim());

        Typing typing = Typing(id: id, text: text, typingKeys: typingKeys);
        await _db.collection('typing').doc(id).set(typing.toJson());
        return const Right(None());
      } catch (e) {
        return Left(GameException(e.toString()));
      }
    } else {
      return Left(GameException("Please check your internet connection!"));
    }
  }

  Future<Either<GameException, List<Typing>>> searchTyping(
      String searchText) async {
    final bool hasInternet = await _internetService.hasInternetConnection();
    if (hasInternet) {
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
    } else {
      return Left(GameException("Please check your internet connection!"));
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
