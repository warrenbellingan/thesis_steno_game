import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:keybinder/keybinder.dart';
import 'package:stacked/stacked.dart';

class SpeedTypingViewModel extends BaseViewModel {
  SpeedTypingViewModel(BuildContext context) {
    characters = steno[currentIndex].split('');
  }


  int currentTimeStamp = 0;
  int currentIndex = 0;
  List<String> words = ["Cat", "To", "Hit", "Cut"];
  List<String> steno = ["KAt", "TO", "HEUt", "KUt"];
  List<String> characters = [];
  String text = "";

  init() {
    HardwareKeyboard.instance.addHandler(_keyEventHandler);
  }

  bool _keyEventHandler(KeyEvent event) {
    if(event is KeyUpEvent) {

    }
    if(event is KeyDownEvent) {
      text = event.character!;
      rebuildUi();
    }
    return true;
  }


  void onToggle(bool isPressed) {
    print("Check Steno");
  }



  Map<String, KeyCode> getSteno = {
    'S': KeyCode.fromSet({PhysicalKeyboardKey.keyQ, PhysicalKeyboardKey.keyA}),
    'T': KeyCode.from(PhysicalKeyboardKey.keyW),
    'K': KeyCode.from(PhysicalKeyboardKey.keyS),
    'P': KeyCode.from(PhysicalKeyboardKey.keyE),
    'W': KeyCode.from(PhysicalKeyboardKey.keyD),
    'H': KeyCode.from(PhysicalKeyboardKey.keyR),
    'R': KeyCode.from(PhysicalKeyboardKey.keyF),
    'A': KeyCode.from(PhysicalKeyboardKey.keyC),
    '*': KeyCode.fromSet({PhysicalKeyboardKey.keyT, PhysicalKeyboardKey.keyG, PhysicalKeyboardKey.keyY, PhysicalKeyboardKey.keyH}),
    'O': KeyCode.from(PhysicalKeyboardKey.keyV),
    'f': KeyCode.from(PhysicalKeyboardKey.keyU),
    'r': KeyCode.from(PhysicalKeyboardKey.keyJ),
    'E': KeyCode.from(PhysicalKeyboardKey.keyN),
    'U': KeyCode.from(PhysicalKeyboardKey.keyM),
    'p': KeyCode.from(PhysicalKeyboardKey.keyI),
    'b': KeyCode.from(PhysicalKeyboardKey.keyK),
    'l': KeyCode.from(PhysicalKeyboardKey.keyO),
    'g': KeyCode.from(PhysicalKeyboardKey.keyL),
    't': KeyCode.from(PhysicalKeyboardKey.keyP),
    's': KeyCode.from(PhysicalKeyboardKey.semicolon),
    'd': KeyCode.from(PhysicalKeyboardKey.bracketLeft),
    "z": KeyCode.from(PhysicalKeyboardKey.quote),
  };

  FocusNode focusNode = FocusNode();

  void nextWord() {}



  @override
  void dispose() {
    Keybinder.dispose();
    super.dispose();
  }


}
