import '../model/user.dart';

abstract interface class SharedPreferenceService {
  Future<void> saveUser(User user);

  Future<User?> getCurrentUser();

  Future<void> deleteCurrentUser();
}
