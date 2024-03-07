import 'dart:async';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:steno_game/app/app.bottomsheets.dart';
import 'package:steno_game/app/app.locator.dart';
import 'package:steno_game/app/app.router.dart';
import 'package:steno_game/repository/user_repository.dart';

import '../../../model/user.dart';

class PeopleViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _userRep = locator<UserRepository>();
  final _bottomSheet = locator<BottomSheetService>();

  StreamSubscription<User>? streamSubscription;

  List<User> users = [];
  late User user;
  List<String> friends = [];
  List<String> friendsRequest = [];

  String btnText = "Add Friend";

  bool isEmptyUserList = false;


  init() async {
    setBusy(true);
    await loadUsers();
    streamSubscription?.cancel();
    streamSubscription = _userRep.streamUserFriends().listen((userData) {
      user = userData;
    });
    setBusy(false);
  }

  bool isFriend(String friendId) {
    if(user.friends.contains(friendId)){
      return true;
    }
    else {
      btnText = "Add friend";
      return false;
    }
  }

  bool haveFriendRequest(String friendId) {
    if(user.friendsRequest.contains(friendId)){
      btnText = "Accept";
      return true;
    }
    else {btnText = "Add Friend";
      return false;
    }
  }

  bool isRequestedFriend(List<String> friendsRequest) {
    if(friendsRequest.contains(user.id)) {
      btnText = "Cancel";
      return true;
    }
    else {
      btnText = "Add Friend";
      return false;
    }
  }

  void requestAddFriend(String friendId) async{
    final response = await _userRep.friendRequest(friendId);
    response.fold((l) => showBottomSheet(l.message), (r) => null);
  }


  void acceptFriendRequest(String friendId) async{
    final response = await _userRep.addFriend(friendId);
    response.fold((l) => showBottomSheet(l.message), (r) => null);
  }

  void onClick(User user) {
    _navigationService.navigateToPersonView(user: user);
  }

  Future<void> loadUsers() async {
    users = await _userRep.getUsers();
    if(users.isEmpty) {
      isEmptyUserList = true;
    }
    else {
      isEmptyUserList = false;
    }

  }
  
  void showBottomSheet(String description) {
    _bottomSheet.showCustomSheet(
      variant: BottomSheetType.notice,
      title: "Notice",
      description: description
    );
  }

  Future<void> loadFriends() async {
    setBusy(true);
    if(friends.isEmpty) {
      isEmptyUserList = true;
      setBusy(false);
      rebuildUi();
      return;
    }
    else {
      isEmptyUserList = false;
    }
    final response = await _userRep.getFriendList(friends);
    setBusy(false);
    response.fold((l) => showBottomSheet(l.message), (usersData) {
      users = usersData;
      rebuildUi();
    });
  }
  Future<void> loadFriendsRequest() async {
    setBusy(true);
    if(friendsRequest.isEmpty) {
      isEmptyUserList = true;
      setBusy(false);
      rebuildUi();
      return;
    }
    else {
      isEmptyUserList = false;
    }
    final response = await _userRep.getFriendList(friendsRequest);
    setBusy(false);
    response.fold((l) => showBottomSheet(l.message), (usersData) {
      users = usersData;
      rebuildUi();
    });

  }

  @override
  void dispose() {
    streamSubscription?.cancel();
    super.dispose();
  }
}
