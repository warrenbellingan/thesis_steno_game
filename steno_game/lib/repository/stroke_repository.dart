import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:steno_game/app/app.locator.dart';
import 'package:steno_game/exception/game_exception.dart';
import 'package:steno_game/model/steno_stroke.dart';
import 'package:steno_game/services/image_service.dart';

import '../services/internet_service.dart';

class StrokeRepository {
  final _db = FirebaseFirestore.instance;
  final _imageService = locator<ImageService>();
  final _internetService = locator<InternetService>();

  Future<Either<GameException, StenoStroke>> getStroke(String strokeId) async {
    final bool hasInternet = await _internetService.hasInternetConnection();
    if (hasInternet) {
      try {
        final stroke = await _db.collection('strokes').doc(strokeId).get();
        StenoStroke stenoStroke = StenoStroke.fromJson(stroke.data()!);
        return Right(stenoStroke);
      } catch (e) {
        return Left(GameException(e.toString()));
      }
    } else {
      return Left(GameException("Please check your internet connection!"));
    }
  }

  Future<Either<GameException, None>> setStatus(
      String strokeId, int status) async {
    final bool hasInternet = await _internetService.hasInternetConnection();
    if (hasInternet) {
      try {
        await _db
            .collection("strokes")
            .doc(strokeId)
            .set({"status": status}, SetOptions(merge: true));
        return const Right(None());
      } catch (e) {
        return Left(GameException(e.toString()));
      }
    } else {
      return Left(GameException("Please check your internet connection!"));
    }
  }

  Future<Either<GameException, None>> updateStroke(StenoStroke stroke) async {
    final bool hasInternet = await _internetService.hasInternetConnection();
    if (hasInternet) {
      try {
        await _db.collection("strokes").doc(stroke.id).set(stroke.toJson());
        return const Right(None());
      } catch (e) {
        return Left(GameException(e.toString()));
      }
    } else {
      return Left(GameException("Please check your internet connection!"));
    }
  }

  Future<Either<GameException, StenoStroke>> editStroke(
      GlobalKey painterKey, String id, String text, String path) async {
    final bool hasInternet = await _internetService.hasInternetConnection();
    if (hasInternet) {
      try {
        RenderRepaintBoundary boundary = painterKey.currentContext!
            .findRenderObject() as RenderRepaintBoundary;
        ui.Image image = await boundary.toImage(pixelRatio: 3.0);
        final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
        final Uint8List pngBytes = byteData!.buffer.asUint8List();
        Directory tempDir = await Directory.systemTemp.createTemp();
        String fileName = 'image_${DateTime.now().millisecondsSinceEpoch}.png';
        String filePath = '${tempDir.path}/$fileName';

        File imageFile = File(filePath);
        await imageFile.writeAsBytes(pngBytes);
        final response = await _uploadImage(imageFile, fileName, path);
        return response.fold(
          (l) => Left(GameException(l.message)),
          (imageUrl) async {
            StenoStroke stroke = StenoStroke(
                id: id,
                text: text,
                strokeImage: imageUrl,
                filePath: path,
                status: 1);
            final update = await updateStroke(stroke);
            return update.fold((l) => Left(GameException(l.message)),
                (r) async {
              return Right(stroke);
            });
          },
        );
      } catch (e) {
        return Left(GameException(e.toString()));
      }
    } else {
      return Left(GameException("Please check your internet connection!"));
    }
  }

  Future<Either<GameException, StenoStroke>> addStroke(
      GlobalKey painterKey, String text, int status, String? path) async {
    final bool hasInternet = await _internetService.hasInternetConnection();
    if (hasInternet) {
      try {
        RenderRepaintBoundary boundary = painterKey.currentContext!
            .findRenderObject() as RenderRepaintBoundary;
        ui.Image image = await boundary.toImage(pixelRatio: 3.0);
        final byteData = await image.toByteData(format: ui.ImageByteFormat.png);

        final Uint8List pngBytes = byteData!.buffer.asUint8List();

        Directory tempDir = await Directory.systemTemp.createTemp();
        String fileName = 'image_${DateTime.now().millisecondsSinceEpoch}.png';
        String filePath = '${tempDir.path}/$fileName';

        File imageFile = File(filePath);
        await imageFile.writeAsBytes(pngBytes);
        path ??= "images/strokes/$fileName";
        print(path);
        final response = await _uploadImage(imageFile, fileName, path);
        return response.fold(
          (l) => Left(GameException(l.message)),
          (imageUrl) async {
            final getImage = await _saveStroke(text, imageUrl, status, path!);
            return getImage.fold((l) => Left(GameException(l.message)),
                (stroke) => Right(stroke));
          },
        );
      } catch (e) {
        return Left(GameException(e.toString()));
      }
    } else {
      return Left(GameException("Please check your internet connection!"));
    }
  }

  Future<Either<GameException, String>> _uploadImage(
      File imageFile, String fileName, String path) async {
    try {
      final response = await _imageService.uploadImage(imageFile, path);
      return response.fold(
        (l) => Left(
          GameException(l.message),
        ),
        (imageUrl) => Right(imageUrl),
      );
    } catch (e) {
      return Left(GameException(e.toString()));
    }
  }

  Future<Either<GameException, StenoStroke>> _saveStroke(
      String text, String imageUrl, int status, String path) async {
    try {
      final id = DateTime.now().millisecondsSinceEpoch.toString();
      StenoStroke stroke = StenoStroke(
          id: id,
          text: text,
          strokeImage: imageUrl,
          status: status,
          filePath: path);
      await _db.collection("strokes").doc(id).set(stroke.toJson());
      return Right(stroke);
    } catch (e) {
      return Left(GameException(e.toString()));
    }
  }

  Future<Either<GameException, List<StenoStroke>>> searchStrokes(
      String searchText) async {
    final bool hasInternet = await _internetService.hasInternetConnection();
    if (hasInternet) {
      try {
        final query1 = await _db.collection('strokes').where("text", isEqualTo: searchText).get().then((value) => value.docs.map((e) => StenoStroke.fromJson(e.data())).toList());
        if(query1.isEmpty) {
          final results = await _db.collection('strokes').get().then((value) =>
              value.docs.map((doc) => StenoStroke.fromJson(doc.data())).toList());
          if (searchText.isNotEmpty) {
            return Right(results
                .where((stroke) => stroke.text
                .toLowerCase()
                .contains(searchText.toString().toLowerCase()))
                .toList());
          }
          return Right(results);
        }
        else {

          return Right(query1);
        }

      } catch (e) {
        return Left(GameException(e.toString()));
      }
    } else {
      return Left(GameException("Please check your internet connection!"));
    }
  }
}
