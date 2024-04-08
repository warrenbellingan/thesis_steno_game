import '../model/lesson.dart';

class LessonStorage {
  final List<Lesson> _offlineLessons = [
    const Lesson(id: "1", title: "Consonants - Written Forward"),
    const Lesson(id: "2", title: "Consonants - Written Downward"),
    const Lesson(id: "3", title: "Vowels - A-Group"),
    const Lesson(id: "4", title: "Vowels - E-Group"),
    const Lesson(id: "5", title: "Vowels - O-Group"),
    const Lesson(id: "6", title: "Vowels - OO-Group"),
    const Lesson(id: "7", title: "Diphthongs"),
  ];

  List<Lesson> getLessons() {
    return _offlineLessons;
  }
}
