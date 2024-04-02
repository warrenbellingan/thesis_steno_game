import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:steno_game/app/app.locator.dart';

class InternetService {

  final _snackBar = locator<SnackbarService>();

  // StreamSubscription<List<ConnectivityResult>>? subscription;
  //
  // void streamInternet() {
  //
  //   print("Stream called");
  //    subscription = Connectivity().onConnectivityChanged.listen((List<ConnectivityResult> result) async{
  //      bool hasInternet = await hasInternetConnection();
  //      print("Stream listened");
  //      if(hasInternet) {
  //        _snackBar.showSnackbar(message: "Internet Connected!", duration: const Duration(seconds: 3));
  //      }
  //      else {
  //        _snackBar.showSnackbar(message: "No Internet Connection!", duration: const Duration(seconds: 3));
  //      }
  //   });
  // }
  Future<bool> hasInternetConnection() async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile)) {
      return true;
    } else if (connectivityResult.contains(ConnectivityResult.wifi)) {
      return true;
    } else if (connectivityResult.contains(ConnectivityResult.ethernet)) {
      return true;
    } else if (connectivityResult.contains(ConnectivityResult.vpn)) {
      return true;
    } else if (connectivityResult.contains(ConnectivityResult.none)) {
      return false;
    } else {
      return false;
    }
   }

  //
  // void dispose() {
  //   print("Stream Closed");
  //   subscription?.cancel();
  // }
}
