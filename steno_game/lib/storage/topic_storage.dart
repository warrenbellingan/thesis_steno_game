import 'package:steno_game/model/picture_topic.dart';

class TopicStorage {
  final List<PictureTopic> _topic1 = [
    const PictureTopic(
        id: "1", stroke: "17", description: "Short Upward Curve"),
    const PictureTopic(
        id: "2", stroke: "11", description: "Longer Upward Curve than K"),
    const PictureTopic(
        id: "3", stroke: "30", description: "Short Downward Curve"),
    const PictureTopic(
        id: "4", stroke: "20", description: "Longer Downward Curve than R"),
    const PictureTopic(
        id: "5", stroke: "26", description: "Short Horizontal Line"),
    const PictureTopic(
        id: "6", stroke: "22", description: "Longer Horizontal Line than N"),
    const PictureTopic(
        id: "7", stroke: "35", description: "Short Diagonal Line"),
    const PictureTopic(
        id: "8", stroke: "5", description: "Longer Diagonal Line than T"),
    const PictureTopic(
        id: "9", stroke: "38", description: "Short Diagonal Curve"),
  ];

  final List<PictureTopic> _topic2 = [
    const PictureTopic(
        id: "1", stroke: "29", description: "Short Downward Left Curve"),
    const PictureTopic(
        id: "2", stroke: "3", description: "Longer Downward Left Curve than P"),
    const PictureTopic(
        id: "3", stroke: "10", description: "Short Downward Right Curve"),
    const PictureTopic(
        id: "4",
        stroke: "39",
        description: "Longer Downward Right Curve than F"),
    const PictureTopic(
        id: "5",
        stroke: "4",
        description: "Normal Downward Left Diagonal Line"),
    const PictureTopic(
        id: "6",
        stroke: "16",
        description: "Longer Downward Left Diagonal Line than CH"),
    const PictureTopic(
        id: "7", stroke: "33", description: "Shorter Downward Curve"),
    const PictureTopic(
        id: "8",
        stroke: "34",
        description: "Shorter Downward Left Diagonal Line than CH"),
    const PictureTopic(id: "9", stroke: "14", description: "A Dot"),
    const PictureTopic(
        id: "10",
        stroke: "27",
        description: "Short Downward Right Diagonal Line"),
    const PictureTopic(
        id: "11",
        stroke: "28",
        description: "Longer Downward Right Diagonal Line than NG"),
  ];
  final List<PictureTopic> _topic3 = [
    const PictureTopic(
        id: "1",
        stroke: "41",
        description: "Short A sound as in cat, Circle Shape"),
    const PictureTopic(
        id: "2",
        stroke: "42",
        description:
            "Medium A sound as in calm, Circle Shape With A Dot Below"),
    const PictureTopic(
        id: "3",
        stroke: "43",
        description:
            "Long A sound as in came, Circle Shape With A Small Diagonal Line Below"),
  ];
  final List<PictureTopic> _topic4 = [
    const PictureTopic(
        id: "1",
        stroke: "44",
        description: "Short i sound as in din, Small Circle Shape"),
    const PictureTopic(
        id: "2",
        stroke: "45",
        description: "Medium E sound as in den, Small Shape With A Dot Below"),
    const PictureTopic(
        id: "3",
        stroke: "46",
        description:
            "Long E sound as in dean, Small Circle Shape With A Small Diagonal Line Below"),
  ];
  final List<PictureTopic> _topic5 = [
    const PictureTopic(
        id: "1",
        stroke: "47",
        description: "Short O sound as in hot, Top Half Circle or U Shape"),
    const PictureTopic(
        id: "2",
        stroke: "48",
        description: "Aw sound as in audit, U Shape With A Small Dot Below"),
    const PictureTopic(
        id: "3",
        stroke: "49",
        description:
            "Long O sound as in ode, U Shape With A Small Diagonal Line Below"),
  ];
  final List<PictureTopic> _topic6 = [
    const PictureTopic(
        id: "1",
        stroke: "50",
        description:
            "Short U sound as in tuck, Bottom Half Circle or Reverse U Shape"),
    const PictureTopic(
        id: "2",
        stroke: "51",
        description:
            "Medium OO sound as in took, Reverse U Shape With A Small Dot Below"),
    const PictureTopic(
        id: "3",
        stroke: "52",
        description:
            "Long OO sound as in doom, Reverse U Shape With A Small Diagonal Line Below"),
  ];
  final List<PictureTopic> _topic7 = [
    const PictureTopic(
        id: "1",
        stroke: "54",
        description: "Combination of i and u sound as in unit"),
    const PictureTopic(
        id: "2",
        stroke: "55",
        description: "Combination of a and u sound like ow sound as in owl"),
    const PictureTopic(
        id: "2",
        stroke: "56",
        description: "Combination of aw and e sound like oi sound as in oil"),
    const PictureTopic(
        id: "2",
        stroke: "53",
        description: "Combination of a and e sound as in isle"),
  ];

  List<PictureTopic> getTopics(String lessonId) {
    List topics = [
      _topic1,
      _topic2,
      _topic3,
      _topic4,
      _topic5,
      _topic6,
      _topic7
    ];
    return topics[int.parse(lessonId) - 1];
  }
}
