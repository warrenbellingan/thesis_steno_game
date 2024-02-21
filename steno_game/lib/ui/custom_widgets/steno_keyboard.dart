
import 'package:flutter/cupertino.dart';
import 'package:steno_game/ui/custom_widgets/steno_key.dart';

import '../common/ui_helpers.dart';

class StenoKeyboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: screenWidth(context),
      padding: gamePadding,
      child: Column(
        children: [
          StenoKey(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StenoKey(
                height: 80,
                width: keyWidth(context),
              ),
              Column(
                children: [
                  StenoKey(
                    width: keyWidth(context),
                  ),
                  StenoKey(
                    width: keyWidth(context),
                  ),
                ],
              ),
              Column(
                children: [
                  StenoKey(
                    width: keyWidth(context),
                  ),
                  StenoKey(
                    width: keyWidth(context),
                  ),
                ],
              ),
              Column(
                children: [
                  StenoKey(
                    width: keyWidth(context),
                  ),
                  StenoKey(
                    width: keyWidth(context),
                  ),
                ],
              ),
              StenoKey(
                height: 80,
                width: keyWidth(context),
              ),
              Column(
                children: [
                  StenoKey(
                    width: keyWidth(context),
                  ),
                  StenoKey(
                    width: keyWidth(context),
                  ),
                ],
              ),
              Column(
                children: [
                  StenoKey(
                    width: keyWidth(context),
                  ),
                  StenoKey(
                    width: keyWidth(context),
                  ),
                ],
              ),
              Column(
                children: [
                  StenoKey(
                    width: keyWidth(context),
                  ),
                  StenoKey(
                    width: keyWidth(context),
                  ),
                ],
              ),
              Column(
                children: [
                  StenoKey(
                    width: keyWidth(context),
                  ),
                  StenoKey(
                    width: keyWidth(context),
                  ),
                ],
              ),
              Column(
                children: [
                  StenoKey(
                    width: keyWidth(context),
                  ),
                  StenoKey(
                    width: keyWidth(context),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              keyVerticalSpace(halfScreenWidth(context) -
                  ((keyWidth(context) / 2 + 12)) -
                  keyWidth(context) * 2 -
                  25 / 2),
              StenoKey(
                width: keyWidth(context),
              ),
              StenoKey(
                width: keyWidth(context),
              ),
              horizontalSpaceMedium,
              StenoKey(
                width: keyWidth(context),
              ),
              StenoKey(
                width: keyWidth(context),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
