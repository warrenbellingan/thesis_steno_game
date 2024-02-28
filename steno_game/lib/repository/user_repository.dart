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

  Stream<User> getStreamUserFriends() {
    final result = _db.collection("users").doc(userId).snapshots();
    return result.map((user) => User.fromJson(user.data()!));
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

  Future<Either<GameException, None>> friendRequest(String friendId) async {
    try {
      await _db.collection("users").doc(userId).update({
        "addFriendRequest": FieldValue.arrayUnion([friendId])
      });
      await _db.collection("users").doc(friendId).update({
        "friendRequest": FieldValue.arrayUnion([userId])
      });
      return const Right(None());
    } catch (e) {
      return Left(GameException(e.toString()));
    }
  }

  Future<Either<GameException, None>> removeFriendRequest(
      String friendId) async {
    try {
      await _db.collection("users").doc(friendId).update({
        "addFriendRequest": FieldValue.arrayRemove([userId])
      });
      await _db.collection("users").doc(userId).update({
        "friendRequest": FieldValue.arrayRemove([friendId])
      });
      return const Right(None());
    } catch (e) {
      return Left(GameException(e.toString()));
    }
  }

  Future<Either<GameException, None>> cancelFriendRequest(
      String friendId) async {
    try {
      await _db.collection("users").doc(userId).update({
        "addFriendRequest": FieldValue.arrayRemove([friendId])
      });
      await _db.collection("users").doc(friendId).update({
        "friendRequest": FieldValue.arrayRemove([userId])
      });
      return const Right(None());
    } catch (e) {
      return Left(GameException(e.toString()));
    }
  }

  Future<Either<GameException, None>> addFriend(String friendId) async {
    try {
      await _db.collection("users").doc(userId).update({
        "friends": FieldValue.arrayUnion([friendId])
      });
      final response = await removeFriendRequest(friendId);
      return response.fold(
          (l) => Left(GameException(l.message)), (r) => const Right(None()));
    } catch (e) {
      return Left(GameException(e.toString()));
    }
  }
}
