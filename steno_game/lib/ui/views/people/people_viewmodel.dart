import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:steno_game/app/app.bottomsheets.dart';
import 'package:steno_game/app/app.locator.dart';
import 'package:steno_game/app/app.router.dart';
import 'package:steno_game/repository/user_repository.dart';
import 'package:steno_game/services/authentication_service.dart';

import '../../../model/user.dart';

class PeopleViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _userRep = locator<UserRepository>();
  final _bottomSheet = locator<BottomSheetService>();
  final _authServ = locator<AuthenticationService>();

  StreamSubscription<User>? streamSubscription;

  List<User> users = [];
  late User user;

  bool isEmptyUserList = false;
  int chipSelectedIndex = 0;
  TextEditingController searchController = TextEditingController();

  init() async {
    setBusy(true);
    final getUser = await _authServ.getCurrentUser();
    getUser.fold((l) {}, (currentUser) async {
      user = currentUser;
      await streamSubscription?.cancel();
      streamSubscription =
          _userRep.streamUserFriends().listen((userData) async {
        user = userData;
        if (chipSelectedIndex == 1) {
          await loadFriends();
        } else if (chipSelectedIndex == 2) {
          await loadFriendsRequest();
        }
        rebuildUi();
      });
    });
    await loadAllUsers();
    setBusy(false);
  }

  Future<void> loadAllUsers() async {
    searchController.clear();
    await searchUsers();
    chipSelectedIndex = 0;
  }

  void onClick(String id) {
    _navigationService.navigateToPersonView(userId: id);
  }

  void goToProfile() {
    _navigationService.navigateToProfileView();
  }

  Future<void> searchUsers() async {
    setBusy(true);
    final response = await _userRep.searchUser(searchController.text);
    response.fold((l) => showBottomSheet(l.message), (usersData) {
      users = usersData;
      users.shuffle();
    });
    if (users.isEmpty) {
      isEmptyUserList = true;
    } else {
      isEmptyUserList = false;
    }
    setBusy(false);
    chipSelectedIndex = 5;
    rebuildUi();
  }

  void showBottomSheet(String description) {
    _bottomSheet.showCustomSheet(
        variant: BottomSheetType.notice,
        title: "Notice",
        description: description);
  }

  Future<void> loadFriends() async {
    setBusy(true);
    chipSelectedIndex = 1;
    if (user.friends.isEmpty) {
      isEmptyUserList = true;
      rebuildUi();
      setBusy(false);
      return;
    } else {
      isEmptyUserList = false;
    }
    final response = await _userRep.getFriendList(user.friends);
    response.fold((l) => showBottomSheet(l.message), (usersData) {
      users = usersData;
      rebuildUi();
    });
    setBusy(false);
  }

  Future<void> loadFriendsRequest() async {
    setBusy(true);
    chipSelectedIndex = 2;
    if (user.friendsRequest.isEmpty) {
      isEmptyUserList = true;
      rebuildUi();
      setBusy(false);
      return;
    } else {
      isEmptyUserList = false;
    }
    final response = await _userRep.getFriendList(user.friendsRequest);
    response.fold((l) => showBottomSheet(l.message), (usersData) {
      users = usersData;
      rebuildUi();
    });
    setBusy(false);
  }

  @override
  void dispose() {
    streamSubscription?.cancel();
    super.dispose();
  }
}
