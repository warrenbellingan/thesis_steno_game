import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:steno_game/app/app.locator.dart';
import 'package:steno_game/repository/stroke_repository.dart';

import '../../../app/app.bottomsheets.dart';

class AddStrokeDialogModel extends BaseViewModel {
  final _strokeRepo = locator<StrokeRepository>();
  final _bottomSheet = locator<BottomSheetService>();

  TextEditingController textController = TextEditingController();

  GlobalKey painterKey = GlobalKey();

  void addClick() async {
    setBusy(true);
    final response =
        await _strokeRepo.addStroke(painterKey, textController.text, 1, null);
    response.fold(
      (l) => showBottomSheet(l.message),
      (r) {
        textController.clear();
        showBottomSheet("Added Successfully");
      },
    );
    rebuildUi();
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
