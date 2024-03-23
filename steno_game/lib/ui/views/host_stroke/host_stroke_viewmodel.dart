import 'package:stacked/stacked.dart';
import 'package:steno_game/app/app.locator.dart';
import 'package:steno_game/model/student.dart';

import '../../../repository/multiplayer_stroke_repository.dart';

class HostStrokeViewModel extends BaseViewModel {

  final _multiStrokeRepo = locator<MultiplayerStrokeRepository>();
  List<Student> students = [];

  String gameId = "";
  List<String> ids = [];
  init() async{
    setBusy(true);
    setBusy(false);
  }

}
