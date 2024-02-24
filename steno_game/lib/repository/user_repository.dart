import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:steno_game/model/user.dart';

class UserRepository {
  final _db = FirebaseFirestore.instance;

  Future<List<User>> getUsers() async {
    final results = await _db.collection('users').get().then((value) => value.docs.map((user) => User.fromJson(user.data())).toList());
    return results;
  }
}