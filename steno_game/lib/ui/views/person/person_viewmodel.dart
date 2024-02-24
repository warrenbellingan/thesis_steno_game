import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../model/user.dart';
import '../../constants/game_png.dart';

class PersonViewModel extends BaseViewModel {
  final User user;

  PersonViewModel(this.user);

  ImageProvider getImage() {
    return const AssetImage(GamePng.gameAvatarPath);
    // if (user.image == null) return const AssetImage(GamePng.gameAvatarPath);
    // return NetworkImage(user.image!);
  }
}
