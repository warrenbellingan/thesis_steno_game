// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/cupertino.dart' as _i32;
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as _i30;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i35;
import 'package:steno_game/model/lesson.dart' as _i33;
import 'package:steno_game/model/multiplayer_stroke.dart' as _i31;
import 'package:steno_game/model/user.dart' as _i34;
import 'package:steno_game/ui/views/achievement/achievement_view.dart' as _i7;
import 'package:steno_game/ui/views/forgot_password/forgot_password_view.dart'
    as _i6;
import 'package:steno_game/ui/views/home/home_view.dart' as _i2;
import 'package:steno_game/ui/views/host_stroke/host_stroke_view.dart' as _i26;
import 'package:steno_game/ui/views/join_multiplayer_stroke/join_multiplayer_stroke_view.dart'
    as _i27;
import 'package:steno_game/ui/views/lessons/lessons_view.dart' as _i8;
import 'package:steno_game/ui/views/login/login_view.dart' as _i4;
import 'package:steno_game/ui/views/menu/menu_view.dart' as _i24;
import 'package:steno_game/ui/views/multiplayer_stroke_host/multiplayer_stroke_host_view.dart'
    as _i29;
import 'package:steno_game/ui/views/multiplayer_stroke_waiting_room/multiplayer_stroke_waiting_room_view.dart'
    as _i28;
import 'package:steno_game/ui/views/people/people_view.dart' as _i9;
import 'package:steno_game/ui/views/person/person_view.dart' as _i22;
import 'package:steno_game/ui/views/picture_topic/picture_topic_view.dart'
    as _i10;
import 'package:steno_game/ui/views/play/play_view.dart' as _i11;
import 'package:steno_game/ui/views/profile/profile_view.dart' as _i12;
import 'package:steno_game/ui/views/quiz_game_stroke/quiz_game_stroke_view.dart'
    as _i13;
import 'package:steno_game/ui/views/search_steno/search_steno_view.dart'
    as _i25;
import 'package:steno_game/ui/views/sign_up/sign_up_view.dart' as _i5;
import 'package:steno_game/ui/views/speed_typing/speed_typing_view.dart'
    as _i21;
import 'package:steno_game/ui/views/startup/startup_view.dart' as _i3;
import 'package:steno_game/ui/views/stroke_exercise/stroke_exercise_view.dart'
    as _i14;
import 'package:steno_game/ui/views/stroke_play/stroke_play_view.dart' as _i16;
import 'package:steno_game/ui/views/strokes_multiplayer/strokes_multiplayer_view.dart'
    as _i15;
import 'package:steno_game/ui/views/text_exercise/text_exercise_view.dart'
    as _i18;
import 'package:steno_game/ui/views/text_quiz/text_quiz_view.dart' as _i17;
import 'package:steno_game/ui/views/topic/topic_view.dart' as _i23;
import 'package:steno_game/ui/views/typing_exercise/typing_exercise_view.dart'
    as _i19;
import 'package:steno_game/ui/views/typing_play/typing_play_view.dart' as _i20;

class Routes {
  static const homeView = '/home-view';

  static const startupView = '/startup-view';

  static const loginView = '/login-view';

  static const signUpView = '/sign-up-view';

  static const forgotPasswordView = '/forgot-password-view';

  static const achievementView = '/achievement-view';

  static const lessonsView = '/lessons-view';

  static const peopleView = '/people-view';

  static const pictureTopicView = '/picture-topic-view';

  static const playView = '/play-view';

  static const profileView = '/profile-view';

  static const quizGameStrokeView = '/quiz-game-stroke-view';

  static const strokeExerciseView = '/stroke-exercise-view';

  static const strokesMultiplayerView = '/strokes-multiplayer-view';

  static const strokePlayView = '/stroke-play-view';

  static const textQuizView = '/text-quiz-view';

  static const textExerciseView = '/text-exercise-view';

  static const typingExerciseView = '/typing-exercise-view';

  static const typingPlayView = '/typing-play-view';

  static const speedTypingView = '/speed-typing-view';

  static const personView = '/person-view';

  static const topicView = '/topic-view';

  static const menuView = '/menu-view';

  static const searchStenoView = '/search-steno-view';

  static const hostStrokeView = '/host-stroke-view';

  static const joinMultiplayerStrokeView = '/join-multiplayer-stroke-view';

  static const multiplayerStrokeWaitingRoomView =
      '/multiplayer-stroke-waiting-room-view';

  static const multiplayerStrokeHostView = '/multiplayer-stroke-host-view';

  static const all = <String>{
    homeView,
    startupView,
    loginView,
    signUpView,
    forgotPasswordView,
    achievementView,
    lessonsView,
    peopleView,
    pictureTopicView,
    playView,
    profileView,
    quizGameStrokeView,
    strokeExerciseView,
    strokesMultiplayerView,
    strokePlayView,
    textQuizView,
    textExerciseView,
    typingExerciseView,
    typingPlayView,
    speedTypingView,
    personView,
    topicView,
    menuView,
    searchStenoView,
    hostStrokeView,
    joinMultiplayerStrokeView,
    multiplayerStrokeWaitingRoomView,
    multiplayerStrokeHostView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.homeView,
      page: _i2.HomeView,
    ),
    _i1.RouteDef(
      Routes.startupView,
      page: _i3.StartupView,
    ),
    _i1.RouteDef(
      Routes.loginView,
      page: _i4.LoginView,
    ),
    _i1.RouteDef(
      Routes.signUpView,
      page: _i5.SignUpView,
    ),
    _i1.RouteDef(
      Routes.forgotPasswordView,
      page: _i6.ForgotPasswordView,
    ),
    _i1.RouteDef(
      Routes.achievementView,
      page: _i7.AchievementView,
    ),
    _i1.RouteDef(
      Routes.lessonsView,
      page: _i8.LessonsView,
    ),
    _i1.RouteDef(
      Routes.peopleView,
      page: _i9.PeopleView,
    ),
    _i1.RouteDef(
      Routes.pictureTopicView,
      page: _i10.PictureTopicView,
    ),
    _i1.RouteDef(
      Routes.playView,
      page: _i11.PlayView,
    ),
    _i1.RouteDef(
      Routes.profileView,
      page: _i12.ProfileView,
    ),
    _i1.RouteDef(
      Routes.quizGameStrokeView,
      page: _i13.QuizGameStrokeView,
    ),
    _i1.RouteDef(
      Routes.strokeExerciseView,
      page: _i14.StrokeExerciseView,
    ),
    _i1.RouteDef(
      Routes.strokesMultiplayerView,
      page: _i15.StrokesMultiplayerView,
    ),
    _i1.RouteDef(
      Routes.strokePlayView,
      page: _i16.StrokePlayView,
    ),
    _i1.RouteDef(
      Routes.textQuizView,
      page: _i17.TextQuizView,
    ),
    _i1.RouteDef(
      Routes.textExerciseView,
      page: _i18.TextExerciseView,
    ),
    _i1.RouteDef(
      Routes.typingExerciseView,
      page: _i19.TypingExerciseView,
    ),
    _i1.RouteDef(
      Routes.typingPlayView,
      page: _i20.TypingPlayView,
    ),
    _i1.RouteDef(
      Routes.speedTypingView,
      page: _i21.SpeedTypingView,
    ),
    _i1.RouteDef(
      Routes.personView,
      page: _i22.PersonView,
    ),
    _i1.RouteDef(
      Routes.topicView,
      page: _i23.TopicView,
    ),
    _i1.RouteDef(
      Routes.menuView,
      page: _i24.MenuView,
    ),
    _i1.RouteDef(
      Routes.searchStenoView,
      page: _i25.SearchStenoView,
    ),
    _i1.RouteDef(
      Routes.hostStrokeView,
      page: _i26.HostStrokeView,
    ),
    _i1.RouteDef(
      Routes.joinMultiplayerStrokeView,
      page: _i27.JoinMultiplayerStrokeView,
    ),
    _i1.RouteDef(
      Routes.multiplayerStrokeWaitingRoomView,
      page: _i28.MultiplayerStrokeWaitingRoomView,
    ),
    _i1.RouteDef(
      Routes.multiplayerStrokeHostView,
      page: _i29.MultiplayerStrokeHostView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.HomeView: (data) {
      return _i30.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.HomeView(),
        settings: data,
      );
    },
    _i3.StartupView: (data) {
      return _i30.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.StartupView(),
        settings: data,
      );
    },
    _i4.LoginView: (data) {
      return _i30.MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.LoginView(),
        settings: data,
      );
    },
    _i5.SignUpView: (data) {
      return _i30.MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.SignUpView(),
        settings: data,
      );
    },
    _i6.ForgotPasswordView: (data) {
      return _i30.MaterialPageRoute<dynamic>(
        builder: (context) => const _i6.ForgotPasswordView(),
        settings: data,
      );
    },
    _i7.AchievementView: (data) {
      return _i30.MaterialPageRoute<dynamic>(
        builder: (context) => const _i7.AchievementView(),
        settings: data,
      );
    },
    _i8.LessonsView: (data) {
      return _i30.MaterialPageRoute<dynamic>(
        builder: (context) => const _i8.LessonsView(),
        settings: data,
      );
    },
    _i9.PeopleView: (data) {
      return _i30.MaterialPageRoute<dynamic>(
        builder: (context) => const _i9.PeopleView(),
        settings: data,
      );
    },
    _i10.PictureTopicView: (data) {
      return _i30.MaterialPageRoute<dynamic>(
        builder: (context) => const _i10.PictureTopicView(),
        settings: data,
      );
    },
    _i11.PlayView: (data) {
      return _i30.MaterialPageRoute<dynamic>(
        builder: (context) => const _i11.PlayView(),
        settings: data,
      );
    },
    _i12.ProfileView: (data) {
      return _i30.MaterialPageRoute<dynamic>(
        builder: (context) => const _i12.ProfileView(),
        settings: data,
      );
    },
    _i13.QuizGameStrokeView: (data) {
      return _i30.MaterialPageRoute<dynamic>(
        builder: (context) => const _i13.QuizGameStrokeView(),
        settings: data,
      );
    },
    _i14.StrokeExerciseView: (data) {
      return _i30.MaterialPageRoute<dynamic>(
        builder: (context) => const _i14.StrokeExerciseView(),
        settings: data,
      );
    },
    _i15.StrokesMultiplayerView: (data) {
      final args = data.getArgs<StrokesMultiplayerViewArguments>(nullOk: false);
      return _i30.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i15.StrokesMultiplayerView(args.game, key: args.key),
        settings: data,
      );
    },
    _i16.StrokePlayView: (data) {
      return _i30.MaterialPageRoute<dynamic>(
        builder: (context) => const _i16.StrokePlayView(),
        settings: data,
      );
    },
    _i17.TextQuizView: (data) {
      return _i30.MaterialPageRoute<dynamic>(
        builder: (context) => const _i17.TextQuizView(),
        settings: data,
      );
    },
    _i18.TextExerciseView: (data) {
      return _i30.MaterialPageRoute<dynamic>(
        builder: (context) => const _i18.TextExerciseView(),
        settings: data,
      );
    },
    _i19.TypingExerciseView: (data) {
      return _i30.MaterialPageRoute<dynamic>(
        builder: (context) => const _i19.TypingExerciseView(),
        settings: data,
      );
    },
    _i20.TypingPlayView: (data) {
      return _i30.MaterialPageRoute<dynamic>(
        builder: (context) => const _i20.TypingPlayView(),
        settings: data,
      );
    },
    _i21.SpeedTypingView: (data) {
      return _i30.MaterialPageRoute<dynamic>(
        builder: (context) => const _i21.SpeedTypingView(),
        settings: data,
      );
    },
    _i22.PersonView: (data) {
      final args = data.getArgs<PersonViewArguments>(nullOk: false);
      return _i30.MaterialPageRoute<dynamic>(
        builder: (context) => _i22.PersonView(args.userId, key: args.key),
        settings: data,
      );
    },
    _i23.TopicView: (data) {
      final args = data.getArgs<TopicViewArguments>(nullOk: false);
      return _i30.MaterialPageRoute<dynamic>(
        builder: (context) => _i23.TopicView(args.lesson, key: args.key),
        settings: data,
      );
    },
    _i24.MenuView: (data) {
      final args = data.getArgs<MenuViewArguments>(nullOk: false);
      return _i30.MaterialPageRoute<dynamic>(
        builder: (context) => _i24.MenuView(args.user, key: args.key),
        settings: data,
      );
    },
    _i25.SearchStenoView: (data) {
      return _i30.MaterialPageRoute<dynamic>(
        builder: (context) => const _i25.SearchStenoView(),
        settings: data,
      );
    },
    _i26.HostStrokeView: (data) {
      return _i30.MaterialPageRoute<dynamic>(
        builder: (context) => const _i26.HostStrokeView(),
        settings: data,
      );
    },
    _i27.JoinMultiplayerStrokeView: (data) {
      return _i30.MaterialPageRoute<dynamic>(
        builder: (context) => const _i27.JoinMultiplayerStrokeView(),
        settings: data,
      );
    },
    _i28.MultiplayerStrokeWaitingRoomView: (data) {
      final args = data.getArgs<MultiplayerStrokeWaitingRoomViewArguments>(
          nullOk: false);
      return _i30.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i28.MultiplayerStrokeWaitingRoomView(args.game, key: args.key),
        settings: data,
      );
    },
    _i29.MultiplayerStrokeHostView: (data) {
      final args =
          data.getArgs<MultiplayerStrokeHostViewArguments>(nullOk: false);
      return _i30.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i29.MultiplayerStrokeHostView(args.game, key: args.key),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class StrokesMultiplayerViewArguments {
  const StrokesMultiplayerViewArguments({
    required this.game,
    this.key,
  });

  final _i31.MultiplayerStroke game;

  final _i32.Key? key;

  @override
  String toString() {
    return '{"game": "$game", "key": "$key"}';
  }

  @override
  bool operator ==(covariant StrokesMultiplayerViewArguments other) {
    if (identical(this, other)) return true;
    return other.game == game && other.key == key;
  }

  @override
  int get hashCode {
    return game.hashCode ^ key.hashCode;
  }
}

class PersonViewArguments {
  const PersonViewArguments({
    required this.userId,
    this.key,
  });

  final String userId;

  final _i32.Key? key;

  @override
  String toString() {
    return '{"userId": "$userId", "key": "$key"}';
  }

  @override
  bool operator ==(covariant PersonViewArguments other) {
    if (identical(this, other)) return true;
    return other.userId == userId && other.key == key;
  }

  @override
  int get hashCode {
    return userId.hashCode ^ key.hashCode;
  }
}

class TopicViewArguments {
  const TopicViewArguments({
    required this.lesson,
    this.key,
  });

  final _i33.Lesson lesson;

  final _i32.Key? key;

  @override
  String toString() {
    return '{"lesson": "$lesson", "key": "$key"}';
  }

  @override
  bool operator ==(covariant TopicViewArguments other) {
    if (identical(this, other)) return true;
    return other.lesson == lesson && other.key == key;
  }

  @override
  int get hashCode {
    return lesson.hashCode ^ key.hashCode;
  }
}

class MenuViewArguments {
  const MenuViewArguments({
    required this.user,
    this.key,
  });

  final _i34.User user;

  final _i32.Key? key;

  @override
  String toString() {
    return '{"user": "$user", "key": "$key"}';
  }

  @override
  bool operator ==(covariant MenuViewArguments other) {
    if (identical(this, other)) return true;
    return other.user == user && other.key == key;
  }

  @override
  int get hashCode {
    return user.hashCode ^ key.hashCode;
  }
}

class MultiplayerStrokeWaitingRoomViewArguments {
  const MultiplayerStrokeWaitingRoomViewArguments({
    required this.game,
    this.key,
  });

  final _i31.MultiplayerStroke game;

  final _i32.Key? key;

  @override
  String toString() {
    return '{"game": "$game", "key": "$key"}';
  }

  @override
  bool operator ==(covariant MultiplayerStrokeWaitingRoomViewArguments other) {
    if (identical(this, other)) return true;
    return other.game == game && other.key == key;
  }

  @override
  int get hashCode {
    return game.hashCode ^ key.hashCode;
  }
}

class MultiplayerStrokeHostViewArguments {
  const MultiplayerStrokeHostViewArguments({
    required this.game,
    this.key,
  });

  final _i31.MultiplayerStroke game;

  final _i32.Key? key;

  @override
  String toString() {
    return '{"game": "$game", "key": "$key"}';
  }

  @override
  bool operator ==(covariant MultiplayerStrokeHostViewArguments other) {
    if (identical(this, other)) return true;
    return other.game == game && other.key == key;
  }

  @override
  int get hashCode {
    return game.hashCode ^ key.hashCode;
  }
}

extension NavigatorStateExtension on _i35.NavigationService {
  Future<dynamic> navigateToHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToLoginView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.loginView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSignUpView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.signUpView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToForgotPasswordView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.forgotPasswordView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAchievementView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.achievementView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToLessonsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.lessonsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToPeopleView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.peopleView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToPictureTopicView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.pictureTopicView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToPlayView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.playView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToProfileView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.profileView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToQuizGameStrokeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.quizGameStrokeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStrokeExerciseView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.strokeExerciseView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStrokesMultiplayerView({
    required _i31.MultiplayerStroke game,
    _i32.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.strokesMultiplayerView,
        arguments: StrokesMultiplayerViewArguments(game: game, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStrokePlayView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.strokePlayView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToTextQuizView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.textQuizView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToTextExerciseView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.textExerciseView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToTypingExerciseView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.typingExerciseView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToTypingPlayView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.typingPlayView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSpeedTypingView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.speedTypingView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToPersonView({
    required String userId,
    _i32.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.personView,
        arguments: PersonViewArguments(userId: userId, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToTopicView({
    required _i33.Lesson lesson,
    _i32.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.topicView,
        arguments: TopicViewArguments(lesson: lesson, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToMenuView({
    required _i34.User user,
    _i32.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.menuView,
        arguments: MenuViewArguments(user: user, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSearchStenoView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.searchStenoView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToHostStrokeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.hostStrokeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToJoinMultiplayerStrokeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.joinMultiplayerStrokeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToMultiplayerStrokeWaitingRoomView({
    required _i31.MultiplayerStroke game,
    _i32.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.multiplayerStrokeWaitingRoomView,
        arguments:
            MultiplayerStrokeWaitingRoomViewArguments(game: game, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToMultiplayerStrokeHostView({
    required _i31.MultiplayerStroke game,
    _i32.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.multiplayerStrokeHostView,
        arguments: MultiplayerStrokeHostViewArguments(game: game, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithLoginView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.loginView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSignUpView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.signUpView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithForgotPasswordView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.forgotPasswordView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAchievementView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.achievementView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithLessonsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.lessonsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithPeopleView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.peopleView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithPictureTopicView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.pictureTopicView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithPlayView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.playView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithProfileView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.profileView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithQuizGameStrokeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.quizGameStrokeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStrokeExerciseView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.strokeExerciseView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStrokesMultiplayerView({
    required _i31.MultiplayerStroke game,
    _i32.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.strokesMultiplayerView,
        arguments: StrokesMultiplayerViewArguments(game: game, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStrokePlayView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.strokePlayView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithTextQuizView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.textQuizView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithTextExerciseView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.textExerciseView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithTypingExerciseView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.typingExerciseView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithTypingPlayView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.typingPlayView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSpeedTypingView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.speedTypingView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithPersonView({
    required String userId,
    _i32.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.personView,
        arguments: PersonViewArguments(userId: userId, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithTopicView({
    required _i33.Lesson lesson,
    _i32.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.topicView,
        arguments: TopicViewArguments(lesson: lesson, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithMenuView({
    required _i34.User user,
    _i32.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.menuView,
        arguments: MenuViewArguments(user: user, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSearchStenoView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.searchStenoView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHostStrokeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.hostStrokeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithJoinMultiplayerStrokeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.joinMultiplayerStrokeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithMultiplayerStrokeWaitingRoomView({
    required _i31.MultiplayerStroke game,
    _i32.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.multiplayerStrokeWaitingRoomView,
        arguments:
            MultiplayerStrokeWaitingRoomViewArguments(game: game, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithMultiplayerStrokeHostView({
    required _i31.MultiplayerStroke game,
    _i32.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.multiplayerStrokeHostView,
        arguments: MultiplayerStrokeHostViewArguments(game: game, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
