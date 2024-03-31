import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:steno_game/app/app.bottomsheets.dart';
import 'package:steno_game/app/app.dialogs.dart';
import 'package:steno_game/app/app.locator.dart';
import 'package:steno_game/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:steno_game/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  setupDialogUi();
  setupBottomSheetUi();
  final Connectivity connectivity = Connectivity();
  List<ConnectivityResult> connectionStatus = await (connectivity.checkConnectivity());
  checkConnection(connectionStatus);
  StreamSubscription<List<ConnectivityResult>> subscription = Connectivity().onConnectivityChanged.listen((List<ConnectivityResult> result) {
    checkConnection(result);
  });

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MainApp());
}

void checkConnection(List<ConnectivityResult> connectionStatus ) {
  if(connectionStatus.contains(ConnectivityResult.mobile)) {
    print("Mobile internet");
  }
  else if(connectionStatus.contains(ConnectivityResult.wifi)) {
    print("Wifi internet");
  }
  else if(connectionStatus.contains(ConnectivityResult.none)){
    print("No internet");
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(textTheme: GoogleFonts.exo2TextTheme()),
      initialRoute: Routes.startupView,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
      navigatorObservers: [
        StackedService.routeObserver,
      ],
    );
  }
}
