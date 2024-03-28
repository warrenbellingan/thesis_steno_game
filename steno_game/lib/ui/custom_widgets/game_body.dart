import '../constants/game_color.dart';
import 'package:flutter/material.dart';

class GameBody extends StatelessWidget {
  const GameBody({
    super.key,
    required this.body,
    this.bottomBar,
    this.floatingAction,
  });

  final Widget body;
  final Widget? bottomBar;
  final Widget? floatingAction;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: GameColor.primaryBackgroundColor,
        body: Padding(
          padding: EdgeInsets.all(16),
          child: body,
        ),
        bottomNavigationBar: bottomBar,
        floatingActionButton: floatingAction,
      ),
    );
  }
}
