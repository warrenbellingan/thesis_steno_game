import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';

class SpeedTypingViewModel extends BaseViewModel {
  SpeedTypingViewModel(BuildContext context) {
    requestScope(context);
    characters = steno[currentIndex].split('');
  }

  int currentTimeStamp = 0;
  int currentIndex = 0;
  List<String> words = ["Cat", "To", "Hit", "Cut"];
  List<String> steno = ["KAt", "TO", "HEUt", "KUt"];
  List<String> characters = [];
  List<String> keyPressed = [];

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
    'u': 'f',
    'j': 'r',
    'n': 'E',
    'm': 'U',
    'i': 'p',
    'k': 'b',
    'o': 'l',
    'l': 'g',
    'p': 't',
    ';': 's',
    '[': 'd',
    "'": 'z',
  };

  FocusNode focusNode = FocusNode();

  void nextWord() {}
  bool checkSteno() {
    if (characters.length != keyPressed.length) {
      return false;
    } else {
      bool returnType = true;
      for (var key in keyPressed) {
        if (!(characters.contains(key))) {
          returnType = false;
          break;
        }
      }
      return returnType;
    }
  }

  void onKeyReceived(KeyEvent event) {
    if (event is KeyDownEvent) {
      print("keypress");
      // final keyLabel = event.character;
      // if(keyLabel != null && keyLabel.isNotEmpty) {
      //   final stenoKey = getSteno[keyLabel];
      //   if(stenoKey != null) {
      //     if(!(keyPressed.contains(stenoKey))) {
      //       keyPressed.add(stenoKey);
      //       if(keyPressed.length == 1){
      //
      //       }
      //       else {
      //         if(event.timeStamp.inMicroseconds - currentTimeStamp > 40) {
      //           bool result = checkSteno();
      //           nextWord();
      //         }
      //       }
      //     }
      //   }
      // }
    } else if (event is KeyUpEvent) {
      print('Keydown');
      currentTimeStamp = event.timeStamp.inMicroseconds;
    }
  }

  requestScope(BuildContext context) {
    FocusScope.of(context).requestFocus(focusNode);
  }
}
