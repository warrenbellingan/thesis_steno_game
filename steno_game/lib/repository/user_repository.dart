import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:steno_game/app/app.locator.dart';
import 'package:steno_game/exception/game_exception.dart';
import 'package:steno_game/model/user.dart';
import 'package:steno_game/services/authentication_service.dart';
import 'package:steno_game/services/image_service.dart';
import 'package:steno_game/services/shared_preference_service.dart';

import '../services/internet_service.dart';

class UserRepository {
  final _db = FirebaseFirestore.instance;
  final _imageService = locator<ImageService>();
  final _sharedPref = locator<SharedPreferenceService>();
  final _authServ = locator<AuthenticationService>();
  final _internetService = locator<InternetService>();

  Future<Either<GameException, None>> updateScore(int gainScore) async {
    final bool hasInternet = await _internetService.hasInternetConnection();
    User? user = await _sharedPref.getCurrentUser();
    if (hasInternet) {
      try {
        await _db
            .collection("users")
            .doc(user!.id)
            .set({"score": user.score + gainScore}, SetOptions(merge: true));
        _authServ.getCurrentUser();
        return const Right(None());
      } catch (e) {
        return Left(GameException(e.toString()));
      }
    } else {
      User updatedUser = User(
        id: user!.id,
        name: user.name,
        email: user.email,
        role: user.role,
        image: user.image,
        achievements: user.achievements,
        completedLevels: user.completedLevels,
        friends: user.friends,
        friendsRequest: user.friendsRequest,
        score: user.score + gainScore,
        typingAccuracy: user.typingAccuracy,
        typingSpeed: user.typingSpeed,
      );
      await _sharedPref.saveUser(updatedUser);
      return const Right(None());
    }
  }

  Future<Either<GameException, List<User>>> searchUser(
      String searchText) async {
    final bool hasInternet = await _internetService.hasInternetConnection();
    if (hasInternet) {
      try {
        final results = await _db.collection('users').get().then((value) =>
            value.docs.map((doc) => User.fromJson(doc.data())).toList());
        if (searchText.isNotEmpty) {
          return Right(results
              .where((users) => users.name
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

  Future<Either<GameException, List<User>>> getUsers() async {
    final bool hasInternet = await _internetService.hasInternetConnection();
    if (hasInternet) {
      try {
        final results = await _db.collection('users').get().then((value) =>
            value.docs.map((user) => User.fromJson(user.data())).toList());
        return Right(results);
      } catch (e) {
        return Left(GameException(e.toString()));
      }
    } else {
      return Left(GameException("Please check your internet connection!"));
    }
  }

  Future<Either<GameException, User>> getUser(String id) async {
    final bool hasInternet = await _internetService.hasInternetConnection();
    if (hasInternet) {
      try {
        final userDoc = await _db.collection('users').doc(id).get();
        return Right(User.fromJson(userDoc.data()!));
      } catch (e) {
        return Left(GameException(e.toString()));
      }
    } else {
      return Left(GameException("Please check your internet connection!"));
    }
  }

  Stream<User> streamUserFriends() {
    final result = _db.collection("users").doc(_sharedPref.userId).snapshots();
    return result.map((user) => User.fromJson(user.data()!));
  }

  Future<Either<GameException, None>> updateName(String name) async {
    final bool hasInternet = await _internetService.hasInternetConnection();
    if (hasInternet) {
      try {
        User? user = await _sharedPref.getCurrentUser();
        await _db
            .collection("users")
            .doc(user!.id)
            .set({"name": name}, SetOptions(merge: true));
        _authServ.getCurrentUser();
        return const Right(None());
      } catch (e) {
        return Left(GameException(e.toString()));
      }
    } else {
      return Left(GameException("Please check your internet connection!"));
    }
  }

  Future<Either<GameException, None>> uploadProfilePicture(
      File imageFile) async {
    final bool hasInternet = await _internetService.hasInternetConnection();
    if (hasInternet) {
      User? user = await _sharedPref.getCurrentUser();
      String path = "images/profiles/${user!.id}";
      try {
        final response = await _imageService.uploadImage(imageFile, path);
        return response.fold(
          (l) => Left(GameException(l.message)),
          (imageUrl) async {
            try {
              await _db
                  .collection("users")
                  .doc(user.id)
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
      return Left(GameException("Please check your internet connection!"));
    }
  }

  Future<Either<GameException, List<User>>> getFriendList(
      List<String> friends) async {
    final bool hasInternet = await _internetService.hasInternetConnection();
    if (hasInternet) {
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
    } else {
      return Left(GameException("Please check your internet connection!"));
    }
  }

  Future<Either<GameException, None>> friendRequest(String friendId) async {
    final bool hasInternet = await _internetService.hasInternetConnection();
    if (hasInternet) {
      try {
        User? user = await _sharedPref.getCurrentUser();
        await _db.collection("users").doc(friendId).update({
          "friendsRequest": FieldValue.arrayUnion([user!.id])
        });
        return const Right(None());
      } catch (e) {
        return Left(GameException(e.toString()));
      }
    } else {
      return Left(GameException("Please check your internet connection!"));
    }
  }

  Future<Either<GameException, None>> removeFriendRequest(
      String friendId) async {
    final bool hasInternet = await _internetService.hasInternetConnection();
    if (hasInternet) {
      User? user = await _sharedPref.getCurrentUser();
      try {
        await _db.collection("users").doc(user!.id).update({
          "friendsRequest": FieldValue.arrayRemove([friendId])
        });
        return const Right(None());
      } catch (e) {
        return Left(GameException(e.toString()));
      }
    } else {
      return Left(GameException("Please check your internet connection!"));
    }
  }

  Future<Either<GameException, None>> cancelFriendRequest(
      String friendId) async {
    final bool hasInternet = await _internetService.hasInternetConnection();
    if (hasInternet) {
      try {
        User? user = await _sharedPref.getCurrentUser();
        await _db.collection("users").doc(friendId).update({
          "friendsRequest": FieldValue.arrayRemove([user!.id])
        });
        return const Right(None());
      } catch (e) {
        return Left(GameException(e.toString()));
      }
    } else {
      return Left(GameException("Please check your internet connection!"));
    }
  }

  Future<Either<GameException, None>> addFriend(String friendId) async {
    final bool hasInternet = await _internetService.hasInternetConnection();
    if (hasInternet) {
      try {
        User? user = await _sharedPref.getCurrentUser();
        await _db.collection("users").doc(user!.id).update({
          "friends": FieldValue.arrayUnion([friendId])
        });
        await _db.collection("users").doc(friendId).update({
          "friends": FieldValue.arrayUnion([user.id])
        });
        final response = await removeFriendRequest(friendId);
        return response.fold(
            (l) => Left(GameException(l.message)), (r) => const Right(None()));
      } catch (e) {
        return Left(GameException(e.toString()));
      }
    } else {
      return Left(GameException("Please check your internet connection!"));
    }
  }

  Future<Either<GameException, None>> unfriend(String friendId) async {
    final bool hasInternet = await _internetService.hasInternetConnection();
    if (hasInternet) {
      try {
        User? user = await _sharedPref.getCurrentUser();
        await _db.collection('users').doc(user!.id).update({
          "friends": FieldValue.arrayRemove([friendId])
        });
        await _db.collection("users").doc(friendId).update({
          "friends": FieldValue.arrayRemove([user.id])
        });
        return const Right(None());
      } catch (e) {
        return Left(GameException(e.toString()));
      }
    } else {
      return Left(GameException("Please check your internet connection!"));
    }
  }
}
