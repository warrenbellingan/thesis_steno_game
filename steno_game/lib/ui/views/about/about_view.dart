import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:steno_game/ui/common/ui_helpers.dart';
import 'package:steno_game/ui/constants/game_color.dart';
import 'package:steno_game/ui/constants/game_ui_png.dart';
import 'package:steno_game/ui/custom_widgets/game_image.dart';

import 'about_viewmodel.dart';

class AboutView extends StackedView<AboutViewModel> {
  const AboutView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    AboutViewModel viewModel,
    Widget? child,
  ) {
    return SingleChildScrollView(
      child: Column(
        children: [
          GameImage(path: GameUiPng.gameLogoPath, size: 200,),
          const Text(
            "StenoSprint",
            style: TextStyle(
              color: GameColor.primaryColor,
              letterSpacing: 3,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),

          verticalSpaceLarge,
          const Text(
            "Developed by:",
            style: TextStyle(
              color: Colors.black,
              letterSpacing: 1,
              wordSpacing: 2.5,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 4),
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 25),
            decoration: BoxDecoration(
              color: GameColor.secondaryBackgroundColor,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [primaryShadow()],
            ),
            child: const Text(
              "Warren L. Bellingan",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.white,
                letterSpacing: 2,
                wordSpacing: 3
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 4),
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 25),
            decoration: BoxDecoration(
              color: GameColor.secondaryBackgroundColor,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [primaryShadow()],
            ),
            child: const Text(
              "April Mae J. Idago",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.white,
                letterSpacing: 2,
                wordSpacing: 3
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 4),
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 25),
            decoration: BoxDecoration(
              color: GameColor.secondaryBackgroundColor,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [primaryShadow()],
            ),
            child: const Text(
              "Cynthia B. Perocho",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.white,
                letterSpacing: 2,
                wordSpacing: 3
              ),
            ),
          ),
          verticalSpaceMedium,
          const Text(
            "Guided by:",
            style: TextStyle(
              color: Colors.black,
              letterSpacing: 1,
              wordSpacing: 2.5,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 4),
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 25),
            decoration: BoxDecoration(
              color: GameColor.secondaryBackgroundColor,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [primaryShadow()],
            ),
            child: const Text(
              "Mr. Darrel A. Cardaña",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.white,
                letterSpacing: 2,
                wordSpacing: 3
              ),
            ),
          ),
          verticalSpaceMedium,
        ],
      ),
    );
  }

  @override
  AboutViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      AboutViewModel();
}
