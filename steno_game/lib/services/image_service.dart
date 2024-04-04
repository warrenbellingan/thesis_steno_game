import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:steno_game/app/app.locator.dart';
import 'package:steno_game/exception/game_exception.dart';
import 'package:steno_game/services/internet_service.dart';

class ImageService {
  final _storageRef = FirebaseStorage.instance.ref();
  final _internetService = locator<InternetService>();

  Future<Either<GameException, String>> uploadImage(
      File image, String path) async {
    final bool hasInternet = await _internetService.hasInternetConnection();
    if (hasInternet) {
      try {
        final imageProfile = await _storageRef.child(path).putFile(image);
        final imageUrl = await imageProfile.ref.getDownloadURL();
        return Right(imageUrl);
      } catch (e) {
        return Left(GameException(e.toString()));
      }
    } else {
      return Left(GameException("Please check your internet connection!"));
    }
  }
}
