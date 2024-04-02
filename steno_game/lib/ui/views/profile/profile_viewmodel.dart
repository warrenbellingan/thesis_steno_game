import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:steno_game/app/app.bottomsheets.dart';
import 'package:steno_game/app/app.dialogs.dart';
import 'package:steno_game/app/app.router.dart';
import 'package:steno_game/services/authentication_service.dart';
import '../../../app/app.locator.dart';
import '../../../model/user.dart';
import '../../../services/shared_preference_service.dart';
import '../../constants/game_ui_png.dart';

class ProfileViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _sharedPref = locator<SharedPreferenceService>();
  final _authService = locator<AuthenticationService>();

  final _bottomSheetServ = locator<BottomSheetService>();
  final _dialogService = locator<DialogService>();

  StreamSubscription<User?>? streamSubscription;
  late User user;

  void init() async {
    setBusy(true);
    user = (await _sharedPref.getCurrentUser())!;
    streamSubscription?.cancel();
    streamSubscription = _sharedPref.userStream.listen((userData) {
      if (userData != null) {
        user = userData;
        rebuildUi();
      }
    });
    setBusy(false);
  }

  bool isStudent() {
    return user.role == "Student";
  }
  void connectAccount() {
    _navigationService.navigateToSignUpView(user: user);
  }

  ImageProvider getImage() {
    if (user.image == null) return const AssetImage(GameUiPng.gameAvatarPath);
    return NetworkImage(user.image!);
  }

  void showUploadPictureDialog() async {
    await _dialogService.showCustomDialog(
      variant: DialogType.updateProfileImage,
    );
  }

  void showUpdateNameDialog() async {
    await _dialogService.showCustomDialog(
      variant: DialogType.updateName,
    );
  }

  void showUpdateEmailDialog() async {
    await _dialogService.showCustomDialog(
      variant: DialogType.updateEmail,
    );
  }

  void showUpdatePasswordDialog() async {
    await _dialogService.showCustomDialog(
      variant: DialogType.updatePassword,
    );
  }

  Future<void> logOut() async {
    setBusy(true);
    final response = await _authService.logout();
    setBusy(false);

    response.fold((l) {
      showBottomSheet(l.message);
    }, (r) {
      _navigationService.popRepeated(1);
      _navigationService.replaceWithLoginView();
    });
  }

  void showBottomSheet(String description) {
    _bottomSheetServ.showCustomSheet(
      variant: BottomSheetType.notice,
      title: "Error",
      description: description,
    );
  }

  @override
  void dispose() {
    streamSubscription?.cancel();
    super.dispose();
  }


}
