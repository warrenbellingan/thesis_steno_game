import 'dart:async';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../model/user.dart';

class SharedPreferenceService {
  late StreamController<User?> _userStreamController;

  String userId = "";

  SharedPreferenceService() {
    _userStreamController = StreamController<User?>.broadcast();
  }
  Stream<User?> get userStream => _userStreamController.stream;

  Future<void> deleteCurrentUser() async {
    final sharedPref = await SharedPreferences.getInstance();
    sharedPref.remove("USER_KEY");
  }

  Future<User?> getCurrentUser() async {
    final sharedPref = await SharedPreferences.getInstance();
    final user = sharedPref.getString("USER_KEY");
    if (user == null) return null;
    return User.fromJson(json.decode(user));
  }

  Future<void> saveUser(User user) async {
    if (_userStreamController.isClosed) {
      _userStreamController = StreamController<User?>.broadcast();
    }
    _userStreamController.add(user);
    final sharedPref = await SharedPreferences.getInstance();
    userId = user.id;
    await sharedPref.setString("USER_KEY", jsonEncode(user.toJson()));
  }

  void dispose() {
    _userStreamController.close();
  }
}
