import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:steno_game/model/text_topic.dart';

import '../../../app/app.bottomsheets.dart';
import '../../../app/app.locator.dart';
import '../../../model/lesson.dart';
import '../../../repository/lesson_repository.dart';
import '../../../repository/topic_repository.dart';

class AddTypingLessonViewModel extends BaseViewModel {
  final _bottomSheet = locator<BottomSheetService>();
  final _lessonRepo = locator<LessonRepository>();
  final _topicRepo = locator<TopicRepository>();

  bool isAddLesson = true;

  TextEditingController lessonTitleController = TextEditingController();

  int currentIndex = 0;

  List<TextTopic> topics = [];

  TextEditingController textController = TextEditingController();

  Lesson? lesson;

  AddTypingLessonViewModel(this.lesson);

  init() {
    if(lesson != null) {
      lessonTitleController.text = lesson!.title;
    }
  }

  void changePage(int index) {
    if (index < 0) {
      return;
    } else if (index > topics.length) {
      return;
    }
    currentIndex = index;
    if(currentIndex < topics.length) {
      textController.text = topics[currentIndex].text;
    }
    else {
      textController.clear();
    }
    rebuildUi();
  }

  Future<void> addLesson() async {
    setBusy(true);
    if (lessonTitleController.text.isEmpty) {
      showBottomSheet("Lesson Title is Required");
    } else {
      final response =
      await _lessonRepo.addLesson(lessonTitleController.text, 'typing');
      response.fold((l) => showBottomSheet(l.message), (lessonData) async{
        showBottomSheet("Added Successfully");
        lesson = lessonData;
        await getTextTopics();
        isAddLesson = false;
        rebuildUi();
      });
    }
    setBusy(false);
  }
  saveLessonClick() async{
    setBusy(true);
    if (lessonTitleController.text.isEmpty) {
      showBottomSheet("Lesson Title is Required");
    } else {
      final response =
      await _lessonRepo.editLesson(lesson!.id,lessonTitleController.text, 'typing');
      response.fold((l) => showBottomSheet(l.message), (lessonData) async{
        showBottomSheet("Saved Successfully");
        lesson = lessonData;
        await getTextTopics();
        isAddLesson = false;
        if(currentIndex < topics.length) {
          textController.text = topics[currentIndex].text;
        }
        rebuildUi();
      });
    }
    setBusy(false);
  }
  Future<void> getTextTopics() async {
    setBusy(true);
    final response = await _topicRepo.getTextTopic(lesson!.id);
    response.fold((l) => showBottomSheet(l.message), (topicsData) {
      topics = topicsData;
      rebuildUi();
    });
    setBusy(false);
  }
  void addTopicClick() async{
    setBusy(true);
    final response = await _topicRepo.addTextTopic(lesson!.id, textController.text);
    response.fold((l) => showBottomSheet(l.message), (r) async{
      showBottomSheet('Topic Added Successfully');
      await getTextTopics();
    });
    setBusy(false);
  }
  void updateTopicClick() async {
    setBusy(true);
    final response = await _topicRepo.updateTextTopic(lesson!.id, topics[currentIndex]);
    response.fold((l) => showBottomSheet(l.message), (r) async{
      showBottomSheet('Topic Saved Successfully');
      await getTextTopics();
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
