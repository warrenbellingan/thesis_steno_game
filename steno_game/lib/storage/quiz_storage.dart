import '../model/quiz.dart';
import '../model/quizzes.dart';

class QuizStorage {
  final List<Quizzes> _quizzes = [
    const Quizzes(id: "1", title: "Quiz 1 - Consonants 1"),
    const Quizzes(id: "2", title: "Quiz 2 - Consonants 2"),
    const Quizzes(id: "3", title: "Quiz 3 - Vowels"),
  ];

  List<Quizzes> getQuizzes() {
    return _quizzes;
  }

  List<Quiz> getQuiz(String id) {
    List quiz = [_quiz1, _quiz2, _quiz3];
    return quiz[int.parse(id) - 1];
  }

  final List<Quiz> _quiz1 = [
    const Quiz(
        id: "1", stroke: "17", choices: ["K", "H", "F", "B"], answer: "K"),
    const Quiz(
        id: "2", stroke: "11", choices: ["K", "H", "G", "B"], answer: "G"),
    const Quiz(
        id: "3", stroke: "30", choices: ["B", "R", "F", "G"], answer: "R"),
    const Quiz(
        id: "4", stroke: "20", choices: ["S", "TH", "L", "M"], answer: "L"),
    const Quiz(
        id: "5", stroke: "26", choices: ["N", "H", "F", "B"], answer: "N"),
    const Quiz(
        id: "6", stroke: "22", choices: ["M", "S", "H", "B"], answer: "M"),
    const Quiz(
        id: "7", stroke: "35", choices: ["M", "H", "F", "TH"], answer: "T"),
    const Quiz(
        id: "8", stroke: "5", choices: ["K", "D", "B", "H"], answer: "D"),
    const Quiz(
        id: "9", stroke: "38", choices: ["CH", "H", "S", "TH"], answer: "TH"),
  ];
  final List<Quiz> _quiz2 = [
    const Quiz(
        id: "1", stroke: "29", choices: ["S", "P", "F", "B"], answer: "P"),
    const Quiz(
        id: "2", stroke: "3", choices: ["NK", "H", "P", "B"], answer: "B"),
    const Quiz(
        id: "3", stroke: "10", choices: ["B", "R", "F", "G"], answer: "F"),
    const Quiz(
        id: "4", stroke: "39", choices: ["V", "B", "L", "M"], answer: "V"),
    const Quiz(
        id: "5", stroke: "4", choices: ["N", "CH", "F", "B"], answer: "CH"),
    const Quiz(
        id: "6", stroke: "16", choices: ["B", "S", "H", "J"], answer: "J"),
    const Quiz(
        id: "7", stroke: "33", choices: ["F", "S", "B", "TH"], answer: "S"),
    const Quiz(
        id: "8", stroke: "34", choices: ["CH", "H", "SH", "TH"], answer: "SH"),
    const Quiz(
        id: "9", stroke: "14", choices: ["CH", "H", "S", "TH"], answer: "H"),
    const Quiz(
        id: "10", stroke: "27", choices: ["NG", "N", "F", "M"], answer: "NG"),
    const Quiz(
        id: "11", stroke: "28", choices: ["NG", "NK", "CH", "B"], answer: "NK"),
  ];
  final List<Quiz> _quiz3 = [
    const Quiz(
        id: "1",
        stroke: "41",
        choices: ["Short A", "Short U", "Long A", "Medium O"],
        answer: "Short A"),
    const Quiz(
        id: "2",
        stroke: "42",
        choices: ["Medium A", "Medium E", "Short OO", "Long A"],
        answer: "Medium A"),
    const Quiz(
        id: "3",
        stroke: "43",
        choices: ["Long A", "Short A", "Medium E", "Short E"],
        answer: "Long A"),
    const Quiz(
        id: "4",
        stroke: "44",
        choices: ["Short I", "Short A", "Medium A", "Short E"],
        answer: "Short I"),
    const Quiz(
        id: "5",
        stroke: "45",
        choices: ["Long U", "Short A", "Long A", "Short E"],
        answer: "Medium E"),
    const Quiz(
        id: "6",
        stroke: "46",
        choices: ["Long E", "Short A", "Long O", "Short E"],
        answer: "Long E"),
    const Quiz(
        id: "7",
        stroke: "47",
        choices: ["Long OO", "Short O", "Short A", "Short U"],
        answer: "Short O"),
    const Quiz(
        id: "8",
        stroke: "48",
        choices: ["Long O", "Short A", "Medium O", "Short I"],
        answer: "Medium O"),
    const Quiz(
        id: "9",
        stroke: "49",
        choices: ["Long O", "Short E", "Medium O", "Medium E"],
        answer: "Long O"),
    const Quiz(
        id: "10",
        stroke: "50",
        choices: ["Short A", "Medium O", "Medium A", "Short U"],
        answer: "Long U"),
    const Quiz(
        id: "11",
        stroke: "51",
        choices: ["Long OO", "Short OO", "Medium OO", "Long E"],
        answer: "Medium OO"),
    const Quiz(
        id: "12",
        stroke: "52",
        choices: ["Long OO", "Short A", "Long E", "Short OO"],
        answer: "Long OO"),
  ];
}
