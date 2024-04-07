import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:steno_game/app/app.router.dart';

import '../../../app/app.dialogs.dart';
import '../../../app/app.locator.dart';
import '../../../model/user.dart';
import '../../../services/shared_preference_service.dart';

class HomeViewModel extends BaseViewModel {
  final _sharedPref = locator<SharedPreferenceService>();

  final PageController pageController = PageController(initialPage: 0);
  final _navigationService = locator<NavigationService>();
  final _dialogService = locator<DialogService>();

  StreamSubscription<User?>? streamSubscription;

  int currentPageIndex = 0;

  late User user;

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

  bool isStudent() {
    return user.role == "Student";
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
    pageController.jumpToPage(index);
    rebuildUi();
  }

  void goToProfileView() {
    _navigationService.navigateToProfileView();
  }

  void addLesson() async {
    await _dialogService.showCustomDialog(
      variant: DialogType.addLesson,
    );
  }

  @override
  void dispose() {
    streamSubscription?.cancel();
    _sharedPref.dispose();
    super.dispose();
  }
}
