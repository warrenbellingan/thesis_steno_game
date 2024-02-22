
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../constants/game_color.dart';
import '../../custom_widgets/game_body.dart';
import '../../custom_widgets/game_button.dart';
import '../../custom_widgets/in_game_bar.dart';
import 'speed_typing_viewmodel.dart';

class SpeedTypingView extends StackedView<SpeedTypingViewModel> {
  const SpeedTypingView({Key? key}) : super(key: key);

  @override
  Widget builder(
      BuildContext context,
      SpeedTypingViewModel viewModel,
      Widget? child,
      ) {
    return GameBody(
      body: SingleChildScrollView(
        child: Column(
          children: [
            InGameBar(),
            SizedBox(
              height: 24,
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(8),
              child: Text(
                "1:00",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Container(
              width: double.infinity,
              height: 500,
              padding: EdgeInsets.all(3),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1.5,
                  style: BorderStyle.solid,
                  color: GameColor.secondaryColor,
                ),
              ),
              child: Text(
                "jdha dahkjdajk djjakd dajh k jd"
                    "jdahfj dajk d afjkda"
                    "adkadjkdjakh jkadjkhda"
                    "dajhhklahd adjkh ajkds fhda"
                    "daghfakhakhgasdhjkfdsag a"
                    "dfahf "
                    "ads"
                    ""
                    " "
                    "d "
                    "sadf ahjdashjgfasd"
                    "adsf adshj hjghasd"
                    " ahjdgghjasdhjgghjdsaghjadsghj",
                style: TextStyle(
                  fontSize: 20,
                  wordSpacing: 2,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(
              height: 18,
            ),
            GameButton(text: "Start", onClick: () {}),
          ],
        ),
      ),
    );
  }

  @override
  SpeedTypingViewModel viewModelBuilder(
      BuildContext context,
      ) =>
      SpeedTypingViewModel();
}
