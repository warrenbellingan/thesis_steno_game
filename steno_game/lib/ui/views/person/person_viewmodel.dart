import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:steno_game/app/app.bottomsheets.dart';
import 'package:steno_game/app/app.locator.dart';
import 'package:steno_game/repository/user_repository.dart';

import '../../../model/user.dart';
import '../../../services/authentication_service.dart';
import '../../constants/game_ui_png.dart';

class PersonViewModel extends BaseViewModel {
  final _userRepo = locator<UserRepository>();
  final _bottomSheet = locator<BottomSheetService>();
  final _authServ = locator<AuthenticationService>();

  String viewedUserId;
  PersonViewModel(this.viewedUserId);

  late User viewedUser;
  late User user;

  int relationship = 0;
  // 0 = not friends, 1 friends, 2 = requestedFriend,  3 = friendRequest

  init() async {
    setBusy(true);
    await getCurrentUser();
    await getViewedUser();
    rebuildUi();
    setBusy(false);
  }

  bool isStudent() {
    return viewedUser.role == "Student";
  }

  Future<void> getCurrentUser() async {
    final response = await _authServ.getCurrentUser();
    response.fold((l) => showBottomSheet(l.message), (userdata) {
      user = userdata;
    });
  }

  Future<void> getViewedUser() async {
    final response = await _userRepo.getUser(viewedUserId);
    response.fold((l) => showBottomSheet(l.message), (userData) {
      viewedUser = userData;
      if (user.friends.contains(viewedUser.id)) {
        relationship = 1;
      } else if (user.friendsRequest.contains(viewedUser.id)) {
        relationship = 3;
      } else if (viewedUser.friendsRequest.contains(user.id)) {
        relationship = 2;
      } else {
        relationship = 0;
      }
    });
  }

  ImageProvider getImage() {
    if (viewedUser.image == null)
      return const AssetImage(GameUiPng.gameAvatarPath);
    return NetworkImage(viewedUser.image!);
  }

  Future<void> addFriend() async {
    setBusy(true);
    final response = await _userRepo.addFriend(viewedUser.id);
    response.fold((l) => showBottomSheet(l.message), (r) => init());
  }

  Future<void> friendRequest() async {
    setBusy(true);
    final response = await _userRepo.friendRequest(viewedUser.id);
    response.fold((l) => showBottomSheet(l.message), (r) => init());
  }

  Future<void> removeFriendRequest() async {
    setBusy(true);
    final response = await _userRepo.removeFriendRequest(viewedUser.id);
    response.fold((l) => showBottomSheet(l.message), (r) => init());
  }

  Future<void> cancelFriendRequest() async {
    setBusy(true);
    final response = await _userRepo.cancelFriendRequest(viewedUser.id);
    response.fold((l) => showBottomSheet(l.message), (r) => init());
  }

  Future<void> unfriend() async {
    setBusy(true);
    final response = await _userRepo.unfriend(viewedUser.id);
    response.fold((l) => showBottomSheet(l.message), (r) => init());
  }

  void showBottomSheet(String description) {
    _bottomSheet.showCustomSheet(
      variant: BottomSheetType.notice,
      title: "Notice",
      description: description,
    );
  }
}
