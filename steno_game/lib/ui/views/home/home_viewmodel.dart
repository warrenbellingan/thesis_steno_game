import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:steno_game/app/app.router.dart';

import '../../../app/app.locator.dart';
import '../../../model/user.dart';
import '../../../services/shared_preference_service.dart';

class HomeViewModel extends BaseViewModel {
  final _sharedPref = locator<SharedPreferenceService>();

  final PageController pageController = PageController(initialPage: 0);
  final _navigationService = locator<NavigationService>();

  StreamSubscription<User?>? streamSubscription;

  int currentPageIndex = 0;

  late User user;

  // String keyText = '';
  // FocusNode focusNode = FocusNode();
  // void onKeyReceived(RawKeyEvent event) {
  //   final keyLabel = event.character!;
  //   if (keyLabel.isNotEmpty) {
  //     keyText = keyLabel;
  //     rebuildUi();
  //   }
  // }
  // bntPressed(BuildContext context) {
  //   FocusScope.of(context).requestFocus(focusNode);
  // }

  init() async {
    setBusy(true);
    user = (await _sharedPref.getCurrentUser())!;
    streamSubscription?.cancel();
    streamSubscription = _sharedPref.userStream.listen((userData) {
      if (userData != null) {
        user = userData;
        rebuildUi();
      }
    });
    setBusy(false);
  }

  void onPageChanged(int index) {
    currentPageIndex = index;
    rebuildUi();
  }

  void changePage(int index) {
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void onDestinationSelected(int index) {
    currentPageIndex = index;
    changePage(currentPageIndex);
  }

  void goToProfileView() {
    _navigationService.navigateToProfileView();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    streamSubscription?.cancel();
    _sharedPref.dispose();
    super.dispose();
  }
}
