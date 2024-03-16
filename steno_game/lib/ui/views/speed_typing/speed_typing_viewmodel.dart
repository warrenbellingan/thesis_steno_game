import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class SpeedTypingViewModel extends BaseViewModel {
  SpeedTypingViewModel(BuildContext context) {
    requestScope(context);
  }

  Map<String, String> getSteno = {
    'q': 'S',
    'a': 'S',
    'w': 'T',
    's': 'K',
    'e': 'P',
    'd': 'W',
    'r': 'H',
    'f': 'R',
    'c': 'A',
    't': '*',
    'g': '*',
    'y': '*',
    'h': '*',
    'v': 'O',
    'u': 'F',
    'j': 'R',
    'n': 'E',
    'm': 'U',
    'i': 'P',
    'k': 'B',
    'o': 'L',
    'l': 'G',
    'p': 'T',
    ';': 'S',
    '[': 'D',
    "'": 'Z',
  };

  String keyText = '';
  FocusNode focusNode = FocusNode();

  void onKeyReceived(KeyEvent event) {
    final keyLabel = event.character;
    if (keyLabel != null && keyLabel.isNotEmpty) {
      keyText = getSteno[keyLabel] ?? '';
      rebuildUi();
    }
  }

  requestScope(BuildContext context) {
    FocusScope.of(context).requestFocus(focusNode);
  }
}
