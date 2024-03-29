import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:steno_game/repository/lesson_repository.dart';

import '../../../app/app.bottomsheets.dart';
import '../../../app/app.locator.dart';

class AddStrokeLessonViewModel extends BaseViewModel {
  final _bottomSheet = locator<BottomSheetService>();
  final _lessonRepo = locator<LessonRepository>();

  TextEditingController lessonTitleController = TextEditingController();

  Future<void> addLesson() async {
    setBusy(true);
    if (lessonTitleController.text.isEmpty) {
      showBottomSheet("Lesson Title is Required");
    } else {
      final response =
          await _lessonRepo.addLesson(lessonTitleController.text, 'strokes');
      response.fold((l) => showBottomSheet(l.message),
          (r) => showBottomSheet("Added Successfully"));
    }
    setBusy(false);
  }

  void showBottomSheet(String description) {
    _bottomSheet.showCustomSheet(
      variant: BottomSheetType.notice,
      title: "Notice",
      description: description,
    );
  }
}
