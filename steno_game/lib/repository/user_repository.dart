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




  Future<Either<GameException, List<User>>> getUsers() async {
    try {
      final results = await _db.collection('users').get().then((value) =>
          value.docs.map((user) => User.fromJson(user.data())).toList());
      return Right(results);
    } catch (e) {
      return Left(GameException(e.toString()));
    }
  }

  Future<Either<GameException, User>> getUser(String id) async {
    try {
      final userDoc = await _db.collection('users').doc(id).get();
      return Right(User.fromJson(userDoc.data()!));
    } catch (e) {
      return Left(GameException(e.toString()));
    }
  }

  Stream<User> streamUserFriends() {

    final result = _db.collection("users").doc(_sharedPref.userId).snapshots();
    return result.map((user) => User.fromJson(user.data()!));
  }


  Future<Either<GameException, None>> updateName(String name) async {
    try {
      await _db
          .collection("users")
          .doc(_sharedPref.userId)
          .set({"name": name}, SetOptions(merge: true));
      _authServ.getCurrentUser();
      return const Right(None());
    } catch (e) {
      return Left(GameException(e.toString()));
    }
  }

  Future<Either<GameException, None>> uploadProfilePicture(
      File imageFile) async {
    String path = "images/profiles/${_sharedPref.userId}";

    try {
      final response = await _imageService.uploadImage(imageFile, path);
      return response.fold(
        (l) => Left(GameException(l.message)),
        (imageUrl) async {
          try {
            await _db
                .collection("users")
                .doc(_sharedPref.userId)
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
    }

  Future<Either<GameException, List<User>>> getFriendList(
      List<String> friends) async {
    try {
      final results = await _db
          .collection("users")
          .where("id", whereIn: friends)
          .get()
          .then((value) =>
              value.docs.map((e) => User.fromJson(e.data())).toList());
      return Right(results);
    } catch (e) {
      return Left(GameException(e.toString()));
    }
  }

  Future<Either<GameException, None>> friendRequest(String friendId) async {
    try {
      await _db.collection("users").doc(friendId).update({
        "friendsRequest": FieldValue.arrayUnion([_sharedPref.userId])
      });
      return const Right(None());
    } catch (e) {
      return Left(GameException(e.toString()));
    }
  }

  Future<Either<GameException, None>> removeFriendRequest(
      String friendId) async {
    try {
      await _db.collection("users").doc(_sharedPref.userId).update({
        "friendsRequest": FieldValue.arrayRemove([friendId])
      });
      return const Right(None());
    } catch (e) {
      return Left(GameException(e.toString()));
    }
  }

  Future<Either<GameException, None>> cancelFriendRequest(
      String friendId) async {
    try {
      await _db.collection("users").doc(friendId).update({
        "friendsRequest": FieldValue.arrayRemove([_sharedPref.userId])
      });
      return const Right(None());
    } catch (e) {
      return Left(GameException(e.toString()));
    }
  }

  Future<Either<GameException, None>> addFriend(String friendId) async {
    try {
      await _db.collection("users").doc(_sharedPref.userId).update({
        "friends": FieldValue.arrayUnion([friendId])
      });
      await _db.collection("users").doc(friendId).update({
        "friends": FieldValue.arrayUnion([_sharedPref.userId])
      });
      final response = await removeFriendRequest(friendId);
      return response.fold(
          (l) => Left(GameException(l.message)), (r) => const Right(None()));
    } catch (e) {
      return Left(GameException(e.toString()));
    }
  }

  Future<Either<GameException, None>> unfriend(String friendId) async {
    try {
      await _db.collection('users').doc(_sharedPref.userId).update({
        "friends": FieldValue.arrayRemove([friendId])
      });
      await _db.collection("users").doc(friendId).update({
        "friends": FieldValue.arrayRemove([_sharedPref.userId])
      });
      return const Right(None());
    } catch (e) {
      return Left(GameException(e.toString()));
    }
  }
}
