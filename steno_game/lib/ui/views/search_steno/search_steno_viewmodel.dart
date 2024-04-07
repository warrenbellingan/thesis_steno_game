import 'package:flutter/widgets.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:steno_game/app/app.dialogs.dart';
import 'package:steno_game/app/app.locator.dart';
import 'package:steno_game/model/steno_stroke.dart';
import 'package:steno_game/model/user.dart';
import 'package:steno_game/repository/stroke_repository.dart';
import 'package:steno_game/services/shared_preference_service.dart';
import 'package:steno_game/ui/common/temp.dart';

import '../../../app/app.bottomsheets.dart';

class SearchStenoViewModel extends BaseViewModel {
  final _strokeRepo = locator<StrokeRepository>();
  final _bottomSheet = locator<BottomSheetService>();
  final _navServ = locator<NavigationService>();
  final _dialogService = locator<DialogService>();
  final _sharedPref = locator<SharedPreferenceService>();
  late User user;

  TextEditingController searchTextController = TextEditingController();

  List<StenoStroke> strokeList = [];

  init() async {
    setBusy(true);
    user = (await _sharedPref.getCurrentUser())!;
    setBusy(false);
    await search();
  }

  Future<void> _searchStroke() async {
    setBusy(true);
    final response = await _strokeRepo.searchStrokes(searchTextController.text);
    response.fold((l) => showBottomSheet(l.message), (list) {
      strokeList = list;
      rebuildUi();
    });
    setBusy(false);
  }

  Future<void> search() async {
    await _searchStroke();
  }

  void editStrokeDialog(StenoStroke stroke) async {
    Temporary.stroke = stroke;
    await _dialogService.showCustomDialog(
      variant: DialogType.editStroke,
    );
  }

  void addSteno() async {
    addStrokeDialog();
  }

  void addStrokeDialog() async {
    await _dialogService.showCustomDialog(
      variant: DialogType.addStroke,
    );
  }

  void showBottomSheet(String description) {
    _bottomSheet.showCustomSheet(
      variant: BottomSheetType.notice,
      title: "Notice",
      description: description,
    );
  }

  void back() {
    _navServ.back();
  }
}
