import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:steno_game/app/app.locator.dart';
import 'package:steno_game/exception/game_exception.dart';
import 'package:steno_game/model/user.dart';
import 'package:steno_game/services/authentication_service.dart';
import 'package:steno_game/services/image_service.dart';
import 'package:steno_game/services/shared_preference_service.dart';

class UserRepository {
  final _db = FirebaseFirestore.instance;
  final _imageService = locator<ImageService>();
  final _sharedPref = locator<SharedPreferenceService>();
  final _authServ = locator<AuthenticationService>();

  late String? userId;

  UserRepository() {
    init();
  }

  void init() async {
    userId = await _sharedPref.getUserId();
  }

  Future<List<User>> getUsers() async {
    final results = await _db.collection('users').get().then((value) =>
        value.docs.map((user) => User.fromJson(user.data())).toList());
    return results;
  }

  Future<Either<GameException, None>> updateName(String name) async {
    try {
      await _db
          .collection("users")
          .doc(userId)
          .set({"name": name}, SetOptions(merge: true));
      _authServ.getCurrentUser();
      return const Right(None());
    } catch (e) {
      return Left(GameException(e.toString()));
    }
  }

  Future<Either<GameException, None>> uploadProfilePicture(
      File imageFile) async {
    if (userId != null) {
      String path = "images/profiles/$userId";

      try {
        final response = await _imageService.uploadImage(imageFile, path);
        return response.fold(
          (l) => Left(GameException(l.message)),
          (imageUrl) async {
            try {
              await _db
                  .collection("users")
                  .doc(userId)
                  .set({"image": imageUrl}, SetOptions(merge: true));
              await _authServ.getCurrentUser();
              return const Right(None());
            } catch (e) {
              return Left(GameException(e.toString()));
            }
          },
        );
      } catch (e) {
        return Left(GameException(e.toString()));
      }
    } else {
      return Left(GameException("No user found"));
    }
  }
}
