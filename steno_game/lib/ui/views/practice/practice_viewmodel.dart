import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:steno_game/model/steno_stroke.dart';
import 'package:steno_game/repository/stroke_repository.dart';

import '../../../app/app.bottomsheets.dart';
import '../../../app/app.locator.dart';

class PracticeViewModel extends BaseViewModel {
  final _strokeRepo = locator<StrokeRepository>();
  final _bottomSheet = locator<BottomSheetService>();
  TextEditingController searchController = TextEditingController();

  List<StenoStroke> strokes = [];

  init() async {
    await searchStroke();
  }

  Future<void> searchStroke() async {
    setBusy(true);
    final results = await _strokeRepo.searchStrokes(searchController.text);
    results.fold((l) => showBottomSheet(l.message), (r) {
      strokes = r;
      rebuildUi();
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
