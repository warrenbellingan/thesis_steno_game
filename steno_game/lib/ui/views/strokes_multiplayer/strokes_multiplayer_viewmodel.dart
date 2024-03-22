import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:steno_game/app/app.bottomsheets.dart';
import '../../../app/app.locator.dart';
import '../../../repository/stroke_repository.dart';

class StrokesMultiplayerViewModel extends BaseViewModel {
  final GlobalKey painterKey = GlobalKey();
  final _strokeRepo = locator<StrokeRepository>();
  final _showBottomSheetServ = locator<BottomSheetService>();

  String text = "Sample Text";


  Future<void> submitImage() async {
    setBusy(true);
    final response = await _strokeRepo.addStroke(painterKey, text);
    response.fold((l) {
      showBottomSheet(l.message);
    }, (r) {
      showBottomSheet("Submitted Successfully");
    });
    setBusy(false);
  }

  void showBottomSheet(String description) {
    _showBottomSheetServ.showCustomSheet(
      variant: BottomSheetType.notice,
      title: "Notice",
      description: description,
    );
  }
}
