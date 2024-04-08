import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:steno_game/app/app.bottomsheets.dart';
import 'package:steno_game/model/steno_stroke.dart';
import 'package:steno_game/repository/stroke_repository.dart';
import 'package:steno_game/repository/topic_repository.dart';
import 'package:steno_game/storage/stroke_storage.dart';
import 'package:steno_game/storage/topic_storage.dart';

import '../../../app/app.locator.dart';
import '../../../model/lesson.dart';

class TopicViewModel extends BaseViewModel {
  final _topicRepo = locator<TopicRepository>();
  final _strokeRepo = locator<StrokeRepository>();
  final _bottomSheet = locator<BottomSheetService>();

  bool isOnline;
  Lesson lesson;

  List topics = [];
  StenoStroke? stroke;
  int currentIndex = 0;

  TopicViewModel(this.lesson, this.isOnline);

  void init() async {
    if(isOnline){
      await getPictureTopics();
      await getStroke();
    }
    else {
      getOfflineTopics();
      getStroke();
    }
  }

  void getOfflineTopics() {
    setBusy(true);
    TopicStorage storage = TopicStorage();
    topics = storage.getTopics(lesson.id);
    setBusy(false);

  }

  Future<void> getPictureTopics() async {
    setBusy(true);
    final response = await _topicRepo.getPictureTopics(lesson.id);
    response.fold((l) => showBottomSheet(l.message), (topicsData) {
      topics = topicsData;
    });
    setBusy(false);
  }

  Future<void> getStroke() async {
    String strokeId = topics[currentIndex].stroke;
    if(isOnline) {
      setBusy(true);
      final response = await _strokeRepo.getStroke(strokeId);
      response.fold((l) => showBottomSheet(l.message), (strokeData) {
        stroke = strokeData;
      });
      setBusy(false);
    }
    else {
      StrokeStorage storage = StrokeStorage();
      stroke = storage.getSteno(strokeId);
    }
  }

  void showBottomSheet(String description) {
    _bottomSheet.showCustomSheet(
      variant: BottomSheetType.notice,
      title: "Notice",
      description: description,
    );
  }

  void changePage(int index) async {
    if (index < 0) {
      return;
    } else if (index > topics.length - 1) {
      return;
    }
    currentIndex = index;
    await getStroke();
    rebuildUi();
  }
}
