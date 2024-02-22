import 'package:dartz/dartz.dart';

import '../exception/game_exception.dart';
import '../model/user.dart';

abstract interface class AuthenticationService {
  bool get isLoggedIn;

  Future<Either<GameException, User>> signUp(
      {required String name,
      required String email,
      required String password,
      required String role});

  Future<Either<GameException, User>> login(
      {required String email, required String password});

  Future<Either<GameException, None>> logout();

  Future<Either<GameException, None>> forgotPassword({required String email});

  Future<Either<GameException, None>> updateName({required String newName});

  Future<Either<GameException, None>> updateEmail(
      {required String currentEmail,
      required String newEmail,
      required String password});

  Future<Either<GameException, None>> updatePassword(
      {required String currentPassword, required String newPassword});
}
