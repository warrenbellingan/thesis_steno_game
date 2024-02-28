import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:steno_game/exception/game_exception.dart';
import 'package:steno_game/model/steno_stroke.dart';

class StrokeRepository {
  final _db = FirebaseFirestore.instance;

  Future<Either<GameException, StenoStroke>> getStroke(String strokeId) async{
    try{
      final stroke = await _db.collection('strokes').doc(strokeId).get();
      StenoStroke stenoStroke = StenoStroke.fromJson(stroke.data()!);
      return Right(stenoStroke);
    }
    catch(e) {
      return Left(GameException(e.toString()));
    }
  }

  Future<Either<GameException, List<StenoStroke>>> searchStrokes(String searchText) async{
    try{
      final results = await _db.collection('strokes').get().then((value) => value.docs.map((doc) => StenoStroke.fromJson(doc.data())).toList());
      if(searchText.isNotEmpty) {
        return Right(results.where((stroke) => stroke.text.toLowerCase().contains(searchText.toString())).toList());
      }
      return Right(results);
    }
    catch (e) {
      return Left(GameException(e.toString()));
    }
  }
}