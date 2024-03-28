import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:steno_game/app/app.locator.dart';
import 'package:steno_game/repository/typing_repository.dart';

import '../../../app/app.bottomsheets.dart';

class AddTypingDialogModel extends BaseViewModel {
  final _typingRepo = locator<TypingRepository>();
  final _bottomSheet = locator<BottomSheetService>();

  TextEditingController textController = TextEditingController();

  TextEditingController typingKeysController = TextEditingController();

  void addClick() async {
    setBusy(true);
    final response = await _typingRepo.addTyping(
        textController.text, typingKeysController.text);
    response.fold((l) => showBottomSheet(l.message), (r) {
      textController.clear();
      typingKeysController.clear();
      rebuildUi();
      showBottomSheet("Added Successfully");
    });
    setBusy(false);
  }

  void showBottomSheet(String description) {
    _bottomSheet.showCustomSheet(
      variant: BottomSheetType.notice,
      title: "Notice",
      description: description,
    );
  }


}
