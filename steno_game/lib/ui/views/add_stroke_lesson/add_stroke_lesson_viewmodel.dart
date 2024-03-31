import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:steno_game/app/app.dialogs.dart';
import 'package:steno_game/repository/lesson_repository.dart';
import 'package:steno_game/repository/topic_repository.dart';
import 'package:steno_game/ui/common/temp.dart';

import '../../../app/app.bottomsheets.dart';
import '../../../app/app.locator.dart';
import '../../../model/lesson.dart';
import '../../../model/picture_topic.dart';
import '../../../model/steno_stroke.dart';
import '../../../repository/stroke_repository.dart';

class AddStrokeLessonViewModel extends BaseViewModel {
  final _bottomSheet = locator<BottomSheetService>();
  final _lessonRepo = locator<LessonRepository>();
  final _topicRepo = locator<TopicRepository>();
  final _strokeRepo = locator<StrokeRepository>();
  final _dialogServ = locator<DialogService>();

  TextEditingController lessonTitleController = TextEditingController();
  bool isAddLesson = true;

  List<PictureTopic> topics = [];
  StenoStroke? stroke;
  Lesson? lesson;
  int currentIndex = 0;

  GlobalKey painterKey = GlobalKey();

  TextEditingController strokeTextController = TextEditingController();

  TextEditingController strokeDescriptionController = TextEditingController();

  AddStrokeLessonViewModel(this.lesson);

  init() {
    if (lesson != null) {
      lessonTitleController.text = lesson!.title;
    }
  }

  Future<void> addLesson() async {
    setBusy(true);
    if (lessonTitleController.text.isEmpty) {
      showBottomSheet("Lesson Title is Required");
    } else {
      final response =
          await _lessonRepo.addLesson(lessonTitleController.text, 'strokes');
      response.fold((l) => showBottomSheet(l.message), (lessonData) async {
        showBottomSheet("Added Successfully");
        lesson = lessonData;
        await getPictureTopics();
        isAddLesson = false;
        rebuildUi();
      });
    }
    setBusy(false);
  }

  saveLessonClick() async {
    setBusy(true);
    if (lessonTitleController.text.isEmpty) {
      showBottomSheet("Lesson Title is Required");
    } else {
      final response = await _lessonRepo.editLesson(
          lesson!.id, lessonTitleController.text, 'strokes');
      response.fold((l) => showBottomSheet(l.message), (lessonData) async {
        showBottomSheet("Saved Successfully");
        lesson = lessonData;
        await getPictureTopics();
        isAddLesson = false;
        rebuildUi();
      });
    }
    setBusy(false);
  }

  Future<void> getPictureTopics() async {
    setBusy(true);
    final response = await _topicRepo.getPictureTopics(lesson!.id);
    response.fold((l) => showBottomSheet(l.message), (topicsData) {
      topics = topicsData;
    });
    setBusy(false);
  }

  Future<void> getStroke() async {
    String strokeId = topics[currentIndex].stroke;
    setBusy(true);
    final response = await _strokeRepo.getStroke(strokeId);
    response.fold((l) => showBottomSheet(l.message), (strokeData) {
      stroke = strokeData;
    });
    setBusy(false);
  }

  void editStroke() async {
    Temporary.stroke = stroke;
    await _dialogServ.showCustomDialog(
      variant: DialogType.editStroke,
    );
    setBusy(true);
    await getStroke();
    setBusy(false);
    rebuildUi();
  }

  void saveClick() async {
    setBusy(true);
    PictureTopic topic = PictureTopic(
        id: topics[currentIndex].id,
        stroke: stroke!.id,
        description: topics[currentIndex].description);
    final response = await _topicRepo.updatePictureTopic(topic, lesson!.id);
    response.fold((l) => showBottomSheet(l.message), (r) {
      showBottomSheet("Saved Successfully");
    });
    setBusy(false);
  }

  void changePage(int index) async {
    if (index < 0) {
      return;
    } else if (index > topics.length) {
      return;
    }
    currentIndex = index;
    if (currentIndex < topics.length) {
      await getStroke();
      strokeDescriptionController.text = topics[currentIndex].description;
    } else {
      strokeDescriptionController.clear();
      strokeTextController.clear();
    }
    rebuildUi();
  }

  void addTopicClick() async {
    setBusy(true);
    final response = await _topicRepo.addPictureTopic(
        lesson!.id,
        strokeDescriptionController.text,
        strokeTextController.text,
        painterKey);
    response.fold((l) => showBottomSheet(l.message), (r) async {
      await getPictureTopics();
      await getStroke();
    });
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
