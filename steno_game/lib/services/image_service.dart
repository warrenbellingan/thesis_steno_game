import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:steno_game/exception/game_exception.dart';
import 'package:steno_game/services/shared_preference_service.dart';

import '../app/app.locator.dart';

class ImageService {
  final _storageRef = FirebaseStorage.instance.ref();
  final _db = FirebaseFirestore.instance;
  final _sharedPrefServ = locator<SharedPreferenceService>();

  Future<Either<GameException, None>> uploadProfileImage(File image) async {
    final userId = await _sharedPrefServ.getUserId();
    if(userId != null) {
      try{
        final path = "images/profiles/$userId";
        final imageProfile = await _storageRef.child(path).putFile(image);
        final imageUrl = await imageProfile.ref.getDownloadURL();

        await _db.collection("users").doc(userId).set({"image": imageUrl}, SetOptions(merge: true));
        return const Right(None());
      } catch(e) {
        return Left(GameException(e.toString()));
      }
    }
    else {
      return Left(GameException("No user found"));
    }
  }
}
