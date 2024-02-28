import 'dart:async';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:steno_game/app/app.locator.dart';
import 'package:steno_game/app/app.router.dart';
import 'package:steno_game/repository/user_repository.dart';

import '../../../model/user.dart';

class PeopleViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  final _userRep = locator<UserRepository>();

  StreamSubscription<User>? streamSubscription;

  List<User> users = [];
  List<String> friends = [];
  List<String> friendRequest = [];
  List<String> addFriendRequest = [];

  init() async {
    setBusy(true);
    await loadUsers();
    streamSubscription?.cancel();
    streamSubscription = _userRep.getStreamUserFriends().listen((userData) {
      friends = userData.friends;
      friendRequest = userData.friendsRequest;
      addFriendRequest = userData.addFriendRequest;
    });
    setBusy(false);
  }

  void onClick(User user) {
    _navigationService.navigateToPersonView(user: user);
  }

  Future<void> loadUsers() async {
    users = await _userRep.getUsers();
  }
  Future<void> loadFriends() async {

  }


  @override
  void dispose() {
    streamSubscription?.cancel();
    super.dispose();
  }
}
