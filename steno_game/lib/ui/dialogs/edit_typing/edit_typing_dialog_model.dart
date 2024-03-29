import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:steno_game/services/shared_preference_service.dart';
import 'package:steno_game/ui/common/temp.dart';
import '../../../app/app.bottomsheets.dart';
import '../../../app/app.locator.dart';
import '../../../model/typing.dart';
import '../../../repository/typing_repository.dart';

class EditTypingDialogModel extends BaseViewModel {
  final _typingRepo = locator<TypingRepository>();
  final _bottomSheet = locator<BottomSheetService>();

  Typing? typing;
  TextEditingController textController = TextEditingController();

  TextEditingController typingKeysController = TextEditingController();

  init() async {
    setBusy(true);
    typing = Temporary.typing!;
    if (typing != null) {
      textController.text = typing!.text;
      typingKeysController.text = typing!.typingKeys.toUpperCase();
    } else {
      showBottomSheet("No Data found");
    }
    rebuildUi();
    setBusy(false);
  }

  void editClick() async {
    setBusy(true);
    typing = Typing(
        id: typing!.id,
        text: textController.text,
        typingKeys: typingKeysController.text);
    final response = await _typingRepo.editTyping(typing!);
    response.fold((l) => showBottomSheet(l.message),
        (r) => showBottomSheet("Saved Successfully"));
    setBusy(false);
  }

  void showBottomSheet(String description) {
    _bottomSheet.showCustomSheet(
      variant: BottomSheetType.notice,
      title: "Notice",
      description: description,
    );
  }

  @override
  void dispose() {
    Temporary.typing == null;
    super.dispose();
  }
}
