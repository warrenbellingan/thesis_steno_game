import 'dart:async';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../model/user.dart';

class SharedPreferenceService {
  final _userStreamController = StreamController<User?>.broadcast();
  Stream<User?> get userStream => _userStreamController.stream;

  Future<void> deleteCurrentUser() async {
    final sharedPref = await SharedPreferences.getInstance();
    sharedPref.remove("USER_KEY");
    _userStreamController.add(null);
  }

  Future<String?> getUserId() async {
    final user = await getCurrentUser();
    if (user != null) {
      return user.id;
    } else {
      return null;
    }
  }

  Future<String?> getUserId() async{
    final user = await getCurrentUser();
    if(user != null) {
      return user.id;
    }
    else {
      return null;
    }
  }

  Future<User?> getCurrentUser() async {
    final sharedPref = await SharedPreferences.getInstance();
    final user = sharedPref.getString("USER_KEY");
    if (user == null) return null;
    return User.fromJson(json.decode(user));
  }

  Future<void> saveUser(User user) async {
    final sharedPref = await SharedPreferences.getInstance();
    sharedPref.setString("USER_KEY", jsonEncode(user.toJson()));
    _userStreamController.add(user);
  }

  void dispose() {
    if (_userStreamController.isClosed) {
      print("the stream is closed");
    }
    _userStreamController.close();
  }
}
