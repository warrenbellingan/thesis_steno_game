import '../constants/game_color.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../app/app.locator.dart';

class GameBar extends StatelessWidget {
  GameBar({
    super.key,
  });

  final _navigationService = locator<NavigationService>();

  void backPressed() {
    _navigationService.back();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(bottom: 16),
      child: IconButton(
        alignment: Alignment.centerLeft,
        onPressed: backPressed,
        color: GameColor.primaryColor,
        iconSize: 40,
        icon: Icon(
          Icons.arrow_back,
        ),
      ),
    );
  }
}
