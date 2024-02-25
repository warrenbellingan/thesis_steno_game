import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:steno_game/app/app.locator.dart';
import 'package:steno_game/app/app.router.dart';
import 'package:steno_game/repository/user_repository.dart';

import '../../../model/user.dart';

class PeopleViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  final _userRep = locator<UserRepository>();
  List<User> users = [];

  init() async {
    setBusy(true);
    await loadUsers();
    setBusy(false);
  }

  void onClick(User user) {
    _navigationService.navigateToPersonView(user: user);
  }

  Future<void> loadUsers() async {
    users = await _userRep.getUsers();
  }
}
