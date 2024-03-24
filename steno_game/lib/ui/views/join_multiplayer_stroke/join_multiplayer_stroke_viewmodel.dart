import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:steno_game/app/app.locator.dart';
import 'package:steno_game/app/app.router.dart';
import 'package:steno_game/repository/multiplayer_stroke_repository.dart';
import '../../../app/app.bottomsheets.dart';
import '../../../model/multiplayer_stroke.dart';

class JoinMultiplayerStrokeViewModel extends BaseViewModel {
  final _multiStrokeRepo = locator<MultiplayerStrokeRepository>();
  final _bottomSheet = locator<BottomSheetService>();
  final _navigationSer = locator<NavigationService>();
  TextEditingController searchTextController = TextEditingController();

  List<MultiplayerStroke> games = [];

  init() async {
    await searchGames();
  }

  Future<void> searchGames() async {
    setBusy(true);
    final response =
        await _multiStrokeRepo.searchGame(searchTextController.text);
    response.fold((l) => showBottomSheet(l.message), (gamesData) {
      games = gamesData;
      rebuildUi();
    });
    setBusy(false);
  }

  void onClickGame(MultiplayerStroke game) {
    _navigationSer.navigateToMultiplayerStrokeWaitingRoomView(game: game);
  }

  void showBottomSheet(String description) {
    _bottomSheet.showCustomSheet(
      variant: BottomSheetType.notice,
      title: "Notice",
      description: description,
    );
  }
}
