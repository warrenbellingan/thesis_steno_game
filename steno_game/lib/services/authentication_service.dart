import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:steno_game/services/shared_preference_service.dart';
import '../app/app.locator.dart';
import '../exception/game_exception.dart';
import '../model/user.dart';

class AuthenticationService {
  final auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;
  final _sharedPref = locator<SharedPreferenceService>();

  Future<Either<GameException, None>> forgotPassword(
      {required String email}) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
      return const Right(None());
    } on FirebaseAuthException catch (e) {
      return Left(GameException(e.message.toString()));
    }
  }

  bool get isLoggedIn => auth.currentUser != null;

  Future<Either<GameException, User>> login(
      {required String email, required String password}) async {
    try {
      final credential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (credential.user == null) {
        return Left(GameException("User not found"));
      }
      final userId = credential.user!.uid;
      final snap = await db.collection("users").doc(userId).get();
      final user = User.fromJson(snap.data()!);
      return Right(user);
    } on FirebaseAuthException catch (e) {
      String errorMessage = e.message.toString();
      if (errorMessage == "wrong-password") {
        errorMessage = "The password you entered is wrong!";
      } else if (errorMessage == "user-not-found") {
        errorMessage = "No user found!";
      }

      return Left(GameException(errorMessage));
    } catch (e) {
      return Left(GameException(e.toString()));
    }
  }

  Future<Either<GameException, None>> logout() async {
    try {
      await auth.signOut();
      await _sharedPref.deleteCurrentUser();
      return const Right(None());
    } catch (e) {
      return Left(GameException(e.toString()));
    }
  }

  Future<Either<GameException, User>> signUp(
      {required String name,
      required String email,
      required String password,
      required String role}) async {
    try {
      UserCredential credential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (credential.user == null) {
        return Left(GameException("User not found"));
      }
      User user =
          User(id: credential.user!.uid, name: name, email: email, role: role);
      await db.collection("users").doc(credential.user!.uid).set(user.toJson());
      return Right(user);
    } on FirebaseAuthException catch (e) {
      String errorMessage = e.message.toString();
      if (e.code == "weak-password") {
        errorMessage = "The password is weak";
      } else if (e.code == "email-already-in-use") {
        errorMessage = "Account already existed";
      }
      return Left(GameException(errorMessage));
    } catch (e) {
      return Left(GameException(e.toString()));
    }
  }

  Future<Either<GameException, None>> updateEmail(
      {required String currentEmail,
      required String newEmail,
      required String password}) async {
    try {
      var response = await login(email: currentEmail, password: password);
      return response.fold((l) => Left(GameException(l.message)), (r) async {
        try {
          await auth.currentUser!.updateEmail(newEmail);
          print('Verify Email');
          await db.collection("users").doc(r.id).update(
            {"email": newEmail},
          );
          print('Saved email');
          await getCurrentUser();
          return const Right(None());
        } catch (e) {
          print(e.toString());
          return Left(GameException(e.toString()));
        }
      });
    } catch (e) {
      return Left(GameException(e.toString()));
    }
  }

  Future<Either<GameException, None>> updatePassword(
      {required String currentPassword, required String newPassword}) async {
    try {
      if (auth.currentUser == null) {
        return Left((GameException("No User Found")));
      }
      var response = await login(
          email: auth.currentUser!.email!, password: currentPassword);
      return response.fold((l) => Left(GameException(l.message)), (r) async {
        try {
          await auth.currentUser!.updatePassword(newPassword);
          return const Right(None());
        } catch (e) {
          return Left(GameException(e.toString()));
        }
      });
    } catch (e) {
      return Left(GameException(e.toString()));
    }
  }

  Future<Either<GameException, User>> getCurrentUser() async {
    final currentUser = await _sharedPref.getCurrentUser();
    if (currentUser == null) {
      return Left(GameException("No Current User"));
    } else {
      final updateUserDoc =
          await db.collection('users').doc(currentUser.id).get();
      User user = User.fromJson(updateUserDoc.data()!);
      await _sharedPref.saveUser(user);
      return Right(User.fromJson(updateUserDoc.data()!));
    }
  }
}
