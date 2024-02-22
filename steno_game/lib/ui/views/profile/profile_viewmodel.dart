import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:steno_game/app/app.router.dart';

import '../../../app/app.locator.dart';
import '../../../model/user.dart';
import '../../../services/shared_preference_service.dart';
import '../../constants/game_png.dart';

class ProfileViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _sharedPref = locator<SharedPreferenceService>();
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

  void logOut() {
    _navigationService.popRepeated(1);
    _navigationService.replaceWithLoginView();
  }
}
