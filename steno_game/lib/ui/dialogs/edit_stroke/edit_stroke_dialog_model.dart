import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:steno_game/repository/stroke_repository.dart';
import 'package:steno_game/ui/common/temp.dart';
import '../../../app/app.bottomsheets.dart';
import '../../../app/app.locator.dart';
import '../../../model/steno_stroke.dart';

class EditStrokeDialogModel extends BaseViewModel {
  final _bottomSheet = locator<BottomSheetService>();
  final _strokeRepo = locator<StrokeRepository>();
  TextEditingController textController = TextEditingController();
  StenoStroke? stroke;
  bool isStrokeEdit = false;

  GlobalKey painterKey = GlobalKey();

  init() async {
    setBusy(true);
    stroke = Temporary.stroke;
    if (stroke != null) {
      textController.text = stroke!.text;
    } else {
      showBottomSheet("No Stroke Data found");
    }
    rebuildUi();
    setBusy(false);
  }

  void editStroke() {
    isStrokeEdit = !isStrokeEdit;
    rebuildUi();
  }

  void saveClick() async {
    setBusy(true);
    if (isStrokeEdit) {
      final response = await _strokeRepo.editStroke(
          painterKey, stroke!.id, textController.text, stroke!.filePath);
      response.fold((l) => showBottomSheet(l.message), (r) {
        stroke = r;
        showBottomSheet("Updated Successfully");
      });
    } else {
      StenoStroke newStroke = StenoStroke(
          id: stroke!.id,
          text: textController.text,
          strokeImage: stroke!.strokeImage,
          filePath: stroke!.filePath,
          status: 1);
      final response = await _strokeRepo.updateStroke(newStroke);
      response.fold((l) => showBottomSheet(l.message), (r) {
        stroke = newStroke;
        showBottomSheet("Updated Successfully");
      });
    }
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

  @override
  void dispose() {
    Temporary.stroke == null;
    super.dispose();
  }
}
