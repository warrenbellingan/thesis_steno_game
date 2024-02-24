import 'package:stacked/stacked.dart';
import 'package:steno_game/app/app.locator.dart';
import 'package:steno_game/repository/user_repository.dart';

import '../../../model/user.dart';

class PeopleViewModel extends BaseViewModel {
  final _userRep = locator<UserRepository>();
  List<User> users = [];

  init() async {
    setBusy(true);
    await loadUsers();
    setBusy(false);

}

  Future<void> loadUsers() async{
    users = await _userRep.getUsers();
  }
}
