import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:steno_game/exception/game_exception.dart';

class ImageService {
  final _storageRef = FirebaseStorage.instance.ref();

  Future<Either<GameException, String>> uploadImage(
      File image, String path) async {
    try {
      final imageProfile = await _storageRef.child(path).putFile(image);
      final imageUrl = await imageProfile.ref.getDownloadURL();
      return Right(imageUrl);
    } catch (e) {
      return Left(GameException(e.toString()));
    }
  }
}
