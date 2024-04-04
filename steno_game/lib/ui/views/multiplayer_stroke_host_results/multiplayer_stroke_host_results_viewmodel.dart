import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:steno_game/app/app.locator.dart';
import 'package:steno_game/repository/multiplayer_stroke_repository.dart';
import '../../../app/app.bottomsheets.dart';
import '../../../model/multiplayer_stroke.dart';

class MultiplayerStrokeHostResultsViewModel extends BaseViewModel {
  final _multiRepo = locator<MultiplayerStrokeRepository>();
  final _bottomSheet = locator<BottomSheetService>();

  MultiplayerStroke game;
  MultiplayerStrokeHostResultsViewModel(this.game);

  init() async {
    setBusy(true);
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
