import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:steno_game/app/app.bottomsheets.dart';
import 'package:steno_game/app/app.locator.dart';
import 'package:steno_game/repository/user_repository.dart';
import 'package:steno_game/services/shared_preference_service.dart';
import 'package:steno_game/ui/common/input_validation.dart';

class UpdateNameDialogModel extends BaseViewModel with InputValidation {
  final _userRepo = locator<UserRepository>();
  final _bottomSheetServ = locator<BottomSheetService>();
  final _sharedPref = locator<SharedPreferenceService>();

  TextEditingController nameTextController = TextEditingController();

  void init() async {
    setBusy(true);
    final user = await _sharedPref.getCurrentUser();
    nameTextController.text = user!.name;
    setBusy(false);
  }

  Future<void> updateName() async {
    String? nameValidation = isValidInput(nameTextController.text, "name");
    if (nameValidation == null) {
      setBusy(true);
      final response = await _userRepo.updateName(nameTextController.text);
      response.fold(
        (l) => showBottomSheet(l.message),
        (r) => showBottomSheet("Name updated successfully"),
      );
      setBusy(false);
    } else {
      showBottomSheet(nameValidation);
    }
  }

  void showBottomSheet(String description) {
    _bottomSheetServ.showCustomSheet(
      variant: BottomSheetType.notice,
      title: "Notice",
      description: description,
    );
  }
}
