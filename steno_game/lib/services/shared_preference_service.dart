import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../model/user.dart';

class SharedPreferenceService {
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
    final sharedPref = await SharedPreferences.getInstance();
    sharedPref.setString("USER_KEY", jsonEncode(user.toJson()));
  }
}
