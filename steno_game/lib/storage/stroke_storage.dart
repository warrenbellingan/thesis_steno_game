import 'package:steno_game/ui/constants/game_stroke_png.dart';

import '../model/steno_stroke.dart';

class StrokeStorage {
  List<StenoStroke> offlineStroke = const [
    StenoStroke(
        id: "1",
        text: "Aim",
        strokeImage: GameStrokePng.aim,
        filePath: "",
        status: 1),
    StenoStroke(
        id: "2",
        text: "Ale",
        strokeImage: GameStrokePng.ale,
        filePath: "",
        status: 1),
    StenoStroke(
        id: "3",
        text: "B",
        strokeImage: GameStrokePng.B,
        filePath: "",
        status: 1),
    StenoStroke(
        id: "4",
        text: "CH",
        strokeImage: GameStrokePng.CH,
        filePath: "",
        status: 1),
    StenoStroke(
        id: "5",
        text: "D",
        strokeImage: GameStrokePng.D,
        filePath: "",
        status: 1),
    StenoStroke(
        id: "7",
        text: "Day",
        strokeImage: GameStrokePng.day,
        filePath: "",
        status: 1),
    StenoStroke(
        id: "8",
        text: "Deed",
        strokeImage: GameStrokePng.deed,
        filePath: "",
        status: 1),
    StenoStroke(
        id: "9",
        text: "Eke",
        strokeImage: GameStrokePng.eke,
        filePath: "",
        status: 1),
    StenoStroke(
        id: "10",
        text: "F",
        strokeImage: GameStrokePng.F,
        filePath: "",
        status: 1),
    StenoStroke(
        id: "11",
        text: "G",
        strokeImage: GameStrokePng.G,
        filePath: "",
        status: 1),
    StenoStroke(
        id: "12",
        text: "Gain",
        strokeImage: GameStrokePng.gain,
        filePath: "",
        status: 1),
    StenoStroke(
        id: "13",
        text: "Gear",
        strokeImage: GameStrokePng.gear,
        filePath: "",
        status: 1),
    StenoStroke(
        id: "14",
        text: "H",
        strokeImage: GameStrokePng.H,
        filePath: "",
        status: 1),
    StenoStroke(
        id: "15",
        text: "Hat",
        strokeImage: GameStrokePng.hat,
        filePath: "",
        status: 1),
    StenoStroke(
        id: "16",
        text: "J",
        strokeImage: GameStrokePng.J,
        filePath: "",
        status: 1),
    StenoStroke(
        id: "17",
        text: "K",
        strokeImage: GameStrokePng.K,
        filePath: "",
        status: 1),
    StenoStroke(
        id: "18",
        text: "Key",
        strokeImage: GameStrokePng.key,
        filePath: "",
        status: 1),
    StenoStroke(
        id: "19",
        text: "Kill",
        strokeImage: GameStrokePng.key,
        filePath: "",
        status: 1),
    StenoStroke(
        id: "20",
        text: "L",
        strokeImage: GameStrokePng.L,
        filePath: "",
        status: 1),
    StenoStroke(
        id: "21",
        text: "Lake",
        strokeImage: GameStrokePng.lake,
        filePath: "",
        status: 1),
    StenoStroke(
        id: "22",
        text: "M",
        strokeImage: GameStrokePng.M,
        filePath: "",
        status: 1),
    StenoStroke(
        id: "23",
        text: "Me",
        strokeImage: GameStrokePng.me,
        filePath: "",
        status: 1),
    StenoStroke(
        id: "24",
        text: "Mean",
        strokeImage: GameStrokePng.mean,
        filePath: "",
        status: 1),
    StenoStroke(
        id: "25",
        text: "Meet",
        strokeImage: GameStrokePng.meet,
        filePath: "",
        status: 1),
    StenoStroke(
        id: "26",
        text: "N",
        strokeImage: GameStrokePng.N,
        filePath: "",
        status: 1),
    StenoStroke(
        id: "27",
        text: "NG",
        strokeImage: GameStrokePng.NG,
        filePath: "",
        status: 1),
    StenoStroke(
        id: "28",
        text: "NK",
        strokeImage: GameStrokePng.NK,
        filePath: "",
        status: 1),
    StenoStroke(
        id: "29",
        text: "P",
        strokeImage: GameStrokePng.P,
        filePath: "",
        status: 1),
    StenoStroke(
        id: "30",
        text: "R",
        strokeImage: GameStrokePng.R,
        filePath: "",
        status: 1),
    StenoStroke(
        id: "31",
        text: "Rail",
        strokeImage: GameStrokePng.rail,
        filePath: "",
        status: 1),
    StenoStroke(
        id: "32",
        text: "Rat",
        strokeImage: GameStrokePng.rat,
        filePath: "",
        status: 1),
    StenoStroke(
        id: "33",
        text: "S",
        strokeImage: GameStrokePng.S,
        filePath: "",
        status: 1),
    StenoStroke(
        id: "34",
        text: "SH",
        strokeImage: GameStrokePng.SH,
        filePath: "",
        status: 1),
    StenoStroke(
        id: "35",
        text: "T",
        strokeImage: GameStrokePng.T,
        filePath: "",
        status: 1),
    StenoStroke(
        id: "36",
        text: "Take",
        strokeImage: GameStrokePng.take,
        filePath: "",
        status: 1),
    StenoStroke(
        id: "37",
        text: "Team",
        strokeImage: GameStrokePng.team,
        filePath: "",
        status: 1),
    StenoStroke(
        id: "38",
        text: "TH",
        strokeImage: GameStrokePng.TH,
        filePath: "",
        status: 1),
    StenoStroke(
        id: "39",
        text: "V",
        strokeImage: GameStrokePng.V,
        filePath: "",
        status: 1),
    StenoStroke(
        id: "40",
        text: "Wreck",
        strokeImage: GameStrokePng.wreck,
        filePath: "",
        status: 1),
    StenoStroke(
        id: "41",
        text: "ă",
        strokeImage: GameStrokePng.shortA,
        filePath: "",
        status: 1),
    StenoStroke(
        id: "42",
        text: "ä",
        strokeImage: GameStrokePng.mediumA,
        filePath: "",
        status: 1),
    StenoStroke(
        id: "43",
        text: "ā",
        strokeImage: GameStrokePng.longA,
        filePath: "",
        status: 1),
    StenoStroke(
        id: "44",
        text: "ĭ",
        strokeImage: GameStrokePng.shortE,
        filePath: "",
        status: 1),
    StenoStroke(
        id: "45",
        text: "ě",
        strokeImage: GameStrokePng.mediumE,
        filePath: "",
        status: 1),
    StenoStroke(
        id: "46",
        text: "ē",
        strokeImage: GameStrokePng.longE,
        filePath: "",
        status: 1),
    StenoStroke(
        id: "47",
        text: "ŏ",
        strokeImage: GameStrokePng.shortO,
        filePath: "",
        status: 1),
    StenoStroke(
        id: "48",
        text: "ö",
        strokeImage: GameStrokePng.mediumO,
        filePath: "",
        status: 1),
    StenoStroke(
        id: "49",
        text: "ō",
        strokeImage: GameStrokePng.longO,
        filePath: "",
        status: 1),
    StenoStroke(
        id: "50",
        text: "ŭ",
        strokeImage: GameStrokePng.shortOO,
        filePath: "",
        status: 1),
    StenoStroke(
        id: "51",
        text: "ŏŏ",
        strokeImage: GameStrokePng.mediumOO,
        filePath: "",
        status: 1),
    StenoStroke(
        id: "52",
        text: "ōō",
        strokeImage: GameStrokePng.longOO,
        filePath: "",
        status: 1),
    StenoStroke(
        id: "53",
        text: "ī",
        strokeImage: GameStrokePng.dipthongsI,
        filePath: "",
        status: 1),
    StenoStroke(
        id: "54",
        text: "ū",
        strokeImage: GameStrokePng.dipthongsU,
        filePath: "",
        status: 1),
    StenoStroke(
        id: "55",
        text: "ow",
        strokeImage: GameStrokePng.dipthongsOw,
        filePath: "",
        status: 1),
    StenoStroke(
        id: "56",
        text: "oi",
        strokeImage: GameStrokePng.dipthongsOi,
        filePath: "",
        status: 1),
  ];

  StenoStroke? getSteno(String id) {
    List result = offlineStroke.where((element) => element.id == id).toList();
    if (result.isNotEmpty) {
      return result[0];
    }
    return null;
  }
}
