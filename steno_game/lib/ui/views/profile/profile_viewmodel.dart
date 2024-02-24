import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:steno_game/app/app.bottomsheets.dart';
import 'package:steno_game/app/app.router.dart';
import 'package:steno_game/services/authentication_service.dart';

import '../../../app/app.locator.dart';
import '../../../model/user.dart';
import '../../../services/shared_preference_service.dart';
import '../../constants/game_png.dart';

class ProfileViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _sharedPref = locator<SharedPreferenceService>();
  final _authService = locator<AuthenticationService>();

  final _bottomSheetServ = locator<BottomSheetService>();
  late User user;

  void init() async {
    setBusy(true);
    user = (await _sharedPref.getCurrentUser())!;
    setBusy(false);
  }

  ImageProvider getImage() {
    if (user.image == null) return const AssetImage(GamePng.gameAvatarPath);
    return NetworkImage(user.image!);
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
}
