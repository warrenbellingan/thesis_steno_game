import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:steno_game/app/app.locator.dart';
import 'package:steno_game/services/shared_preference_service.dart';

class InternetService {
  final _sharedPref = locator<SharedPreferenceService>();

  Future<bool> hasInternetConnection() async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    bool isOnline = false;
    if (connectivityResult.contains(ConnectivityResult.mobile)) {
      isOnline = true;
    } else if (connectivityResult.contains(ConnectivityResult.wifi)) {
      isOnline = true;
    } else if (connectivityResult.contains(ConnectivityResult.ethernet)) {
      isOnline = true;
    } else if (connectivityResult.contains(ConnectivityResult.vpn)) {
      isOnline = true;
    } else if (connectivityResult.contains(ConnectivityResult.none)) {
      isOnline = false;
    } else {
      isOnline = false;
    }
    await _sharedPref.setIsPreviousOnline(isOnline);
    print("Has Internet: $isOnline");
    return isOnline;
  }
}
