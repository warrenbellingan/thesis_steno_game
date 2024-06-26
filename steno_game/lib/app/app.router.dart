// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/cupertino.dart' as _i30;
import 'package:flutter/material.dart' as _i28;
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i34;
import 'package:steno_game/model/lesson.dart' as _i32;
import 'package:steno_game/model/multiplayer_stroke.dart' as _i31;
import 'package:steno_game/model/quizzes.dart' as _i33;
import 'package:steno_game/model/user.dart' as _i29;
import 'package:steno_game/ui/views/about/about_view.dart' as _i27;
import 'package:steno_game/ui/views/add_edit_quiz/add_edit_quiz_view.dart'
    as _i26;
import 'package:steno_game/ui/views/add_stroke_lesson/add_stroke_lesson_view.dart'
    as _i22;
import 'package:steno_game/ui/views/forgot_password/forgot_password_view.dart'
    as _i6;
import 'package:steno_game/ui/views/home/home_view.dart' as _i2;
import 'package:steno_game/ui/views/host_stroke/host_stroke_view.dart' as _i18;
import 'package:steno_game/ui/views/join_multiplayer_stroke/join_multiplayer_stroke_view.dart'
    as _i19;
import 'package:steno_game/ui/views/lessons/lessons_view.dart' as _i7;
import 'package:steno_game/ui/views/login/login_view.dart' as _i4;
import 'package:steno_game/ui/views/menu/menu_view.dart' as _i16;
import 'package:steno_game/ui/views/multiplayer_stroke_host/multiplayer_stroke_host_view.dart'
    as _i21;
import 'package:steno_game/ui/views/multiplayer_stroke_host_results/multiplayer_stroke_host_results_view.dart'
    as _i23;
import 'package:steno_game/ui/views/multiplayer_stroke_waiting_room/multiplayer_stroke_waiting_room_view.dart'
    as _i20;
import 'package:steno_game/ui/views/people/people_view.dart' as _i8;
import 'package:steno_game/ui/views/person/person_view.dart' as _i14;
import 'package:steno_game/ui/views/practice/practice_view.dart' as _i24;
import 'package:steno_game/ui/views/profile/profile_view.dart' as _i9;
import 'package:steno_game/ui/views/quiz/quiz_view.dart' as _i25;
import 'package:steno_game/ui/views/quiz_game_stroke/quiz_game_stroke_view.dart'
    as _i10;
import 'package:steno_game/ui/views/search_steno/search_steno_view.dart'
    as _i17;
import 'package:steno_game/ui/views/sign_up/sign_up_view.dart' as _i5;
import 'package:steno_game/ui/views/startup/startup_view.dart' as _i3;
import 'package:steno_game/ui/views/stroke_exercise/stroke_exercise_view.dart'
    as _i11;
import 'package:steno_game/ui/views/stroke_play/stroke_play_view.dart' as _i13;
import 'package:steno_game/ui/views/strokes_multiplayer/strokes_multiplayer_view.dart'
    as _i12;
import 'package:steno_game/ui/views/topic/topic_view.dart' as _i15;

class Routes {
  static const homeView = '/home-view';

  static const startupView = '/startup-view';

  static const loginView = '/login-view';

  static const signUpView = '/sign-up-view';

  static const forgotPasswordView = '/forgot-password-view';

  static const lessonsView = '/lessons-view';

  static const peopleView = '/people-view';

  static const profileView = '/profile-view';

  static const quizGameStrokeView = '/quiz-game-stroke-view';

  static const strokeExerciseView = '/stroke-exercise-view';

  static const strokesMultiplayerView = '/strokes-multiplayer-view';

  static const strokePlayView = '/stroke-play-view';

  static const personView = '/person-view';

  static const topicView = '/topic-view';

  static const menuView = '/menu-view';

  static const searchStenoView = '/search-steno-view';

  static const hostStrokeView = '/host-stroke-view';

  static const joinMultiplayerStrokeView = '/join-multiplayer-stroke-view';

  static const multiplayerStrokeWaitingRoomView =
      '/multiplayer-stroke-waiting-room-view';

  static const multiplayerStrokeHostView = '/multiplayer-stroke-host-view';

  static const addStrokeLessonView = '/add-stroke-lesson-view';

  static const multiplayerStrokeHostResultsView =
      '/multiplayer-stroke-host-results-view';

  static const practiceView = '/practice-view';

  static const quizView = '/quiz-view';

  static const addEditQuizView = '/add-edit-quiz-view';

  static const aboutView = '/about-view';

  static const all = <String>{
    homeView,
    startupView,
    loginView,
    signUpView,
    forgotPasswordView,
    lessonsView,
    peopleView,
    profileView,
    quizGameStrokeView,
    strokeExerciseView,
    strokesMultiplayerView,
    strokePlayView,
    personView,
    topicView,
    menuView,
    searchStenoView,
    hostStrokeView,
    joinMultiplayerStrokeView,
    multiplayerStrokeWaitingRoomView,
    multiplayerStrokeHostView,
    addStrokeLessonView,
    multiplayerStrokeHostResultsView,
    practiceView,
    quizView,
    addEditQuizView,
    aboutView,
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
      Routes.lessonsView,
      page: _i7.LessonsView,
    ),
    _i1.RouteDef(
      Routes.peopleView,
      page: _i8.PeopleView,
    ),
    _i1.RouteDef(
      Routes.profileView,
      page: _i9.ProfileView,
    ),
    _i1.RouteDef(
      Routes.quizGameStrokeView,
      page: _i10.QuizGameStrokeView,
    ),
    _i1.RouteDef(
      Routes.strokeExerciseView,
      page: _i11.StrokeExerciseView,
    ),
    _i1.RouteDef(
      Routes.strokesMultiplayerView,
      page: _i12.StrokesMultiplayerView,
    ),
    _i1.RouteDef(
      Routes.strokePlayView,
      page: _i13.StrokePlayView,
    ),
    _i1.RouteDef(
      Routes.personView,
      page: _i14.PersonView,
    ),
    _i1.RouteDef(
      Routes.topicView,
      page: _i15.TopicView,
    ),
    _i1.RouteDef(
      Routes.menuView,
      page: _i16.MenuView,
    ),
    _i1.RouteDef(
      Routes.searchStenoView,
      page: _i17.SearchStenoView,
    ),
    _i1.RouteDef(
      Routes.hostStrokeView,
      page: _i18.HostStrokeView,
    ),
    _i1.RouteDef(
      Routes.joinMultiplayerStrokeView,
      page: _i19.JoinMultiplayerStrokeView,
    ),
    _i1.RouteDef(
      Routes.multiplayerStrokeWaitingRoomView,
      page: _i20.MultiplayerStrokeWaitingRoomView,
    ),
    _i1.RouteDef(
      Routes.multiplayerStrokeHostView,
      page: _i21.MultiplayerStrokeHostView,
    ),
    _i1.RouteDef(
      Routes.addStrokeLessonView,
      page: _i22.AddStrokeLessonView,
    ),
    _i1.RouteDef(
      Routes.multiplayerStrokeHostResultsView,
      page: _i23.MultiplayerStrokeHostResultsView,
    ),
    _i1.RouteDef(
      Routes.practiceView,
      page: _i24.PracticeView,
    ),
    _i1.RouteDef(
      Routes.quizView,
      page: _i25.QuizView,
    ),
    _i1.RouteDef(
      Routes.addEditQuizView,
      page: _i26.AddEditQuizView,
    ),
    _i1.RouteDef(
      Routes.aboutView,
      page: _i27.AboutView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.HomeView: (data) {
      return _i28.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.HomeView(),
        settings: data,
      );
    },
    _i3.StartupView: (data) {
      return _i28.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.StartupView(),
        settings: data,
      );
    },
    _i4.LoginView: (data) {
      return _i28.MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.LoginView(),
        settings: data,
      );
    },
    _i5.SignUpView: (data) {
      final args = data.getArgs<SignUpViewArguments>(nullOk: false);
      return _i28.MaterialPageRoute<dynamic>(
        builder: (context) => _i5.SignUpView(args.user, key: args.key),
        settings: data,
      );
    },
    _i6.ForgotPasswordView: (data) {
      return _i28.MaterialPageRoute<dynamic>(
        builder: (context) => const _i6.ForgotPasswordView(),
        settings: data,
      );
    },
    _i7.LessonsView: (data) {
      return _i28.MaterialPageRoute<dynamic>(
        builder: (context) => const _i7.LessonsView(),
        settings: data,
      );
    },
    _i8.PeopleView: (data) {
      return _i28.MaterialPageRoute<dynamic>(
        builder: (context) => const _i8.PeopleView(),
        settings: data,
      );
    },
    _i9.ProfileView: (data) {
      return _i28.MaterialPageRoute<dynamic>(
        builder: (context) => const _i9.ProfileView(),
        settings: data,
      );
    },
    _i10.QuizGameStrokeView: (data) {
      return _i28.MaterialPageRoute<dynamic>(
        builder: (context) => const _i10.QuizGameStrokeView(),
        settings: data,
      );
    },
    _i11.StrokeExerciseView: (data) {
      return _i28.MaterialPageRoute<dynamic>(
        builder: (context) => const _i11.StrokeExerciseView(),
        settings: data,
      );
    },
    _i12.StrokesMultiplayerView: (data) {
      final args = data.getArgs<StrokesMultiplayerViewArguments>(nullOk: false);
      return _i28.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i12.StrokesMultiplayerView(args.game, key: args.key),
        settings: data,
      );
    },
    _i13.StrokePlayView: (data) {
      return _i28.MaterialPageRoute<dynamic>(
        builder: (context) => const _i13.StrokePlayView(),
        settings: data,
      );
    },
    _i14.PersonView: (data) {
      final args = data.getArgs<PersonViewArguments>(nullOk: false);
      return _i28.MaterialPageRoute<dynamic>(
        builder: (context) => _i14.PersonView(args.userId, key: args.key),
        settings: data,
      );
    },
    _i15.TopicView: (data) {
      final args = data.getArgs<TopicViewArguments>(nullOk: false);
      return _i28.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i15.TopicView(args.lesson, args.isOnline, key: args.key),
        settings: data,
      );
    },
    _i16.MenuView: (data) {
      final args = data.getArgs<MenuViewArguments>(nullOk: false);
      return _i28.MaterialPageRoute<dynamic>(
        builder: (context) => _i16.MenuView(args.user, key: args.key),
        settings: data,
      );
    },
    _i17.SearchStenoView: (data) {
      return _i28.MaterialPageRoute<dynamic>(
        builder: (context) => const _i17.SearchStenoView(),
        settings: data,
      );
    },
    _i18.HostStrokeView: (data) {
      final args = data.getArgs<HostStrokeViewArguments>(nullOk: false);
      return _i28.MaterialPageRoute<dynamic>(
        builder: (context) => _i18.HostStrokeView(args.game, key: args.key),
        settings: data,
      );
    },
    _i19.JoinMultiplayerStrokeView: (data) {
      return _i28.MaterialPageRoute<dynamic>(
        builder: (context) => const _i19.JoinMultiplayerStrokeView(),
        settings: data,
      );
    },
    _i20.MultiplayerStrokeWaitingRoomView: (data) {
      final args = data.getArgs<MultiplayerStrokeWaitingRoomViewArguments>(
          nullOk: false);
      return _i28.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i20.MultiplayerStrokeWaitingRoomView(args.game, key: args.key),
        settings: data,
      );
    },
    _i21.MultiplayerStrokeHostView: (data) {
      final args =
          data.getArgs<MultiplayerStrokeHostViewArguments>(nullOk: false);
      return _i28.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i21.MultiplayerStrokeHostView(args.game, key: args.key),
        settings: data,
      );
    },
    _i22.AddStrokeLessonView: (data) {
      final args = data.getArgs<AddStrokeLessonViewArguments>(nullOk: false);
      return _i28.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i22.AddStrokeLessonView(args.lesson, key: args.key),
        settings: data,
      );
    },
    _i23.MultiplayerStrokeHostResultsView: (data) {
      final args = data.getArgs<MultiplayerStrokeHostResultsViewArguments>(
          nullOk: false);
      return _i28.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i23.MultiplayerStrokeHostResultsView(args.game, key: args.key),
        settings: data,
      );
    },
    _i24.PracticeView: (data) {
      return _i28.MaterialPageRoute<dynamic>(
        builder: (context) => const _i24.PracticeView(),
        settings: data,
      );
    },
    _i25.QuizView: (data) {
      final args = data.getArgs<QuizViewArguments>(nullOk: false);
      return _i28.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i25.QuizView(args.game, args.isOnline, key: args.key),
        settings: data,
      );
    },
    _i26.AddEditQuizView: (data) {
      final args = data.getArgs<AddEditQuizViewArguments>(nullOk: false);
      return _i28.MaterialPageRoute<dynamic>(
        builder: (context) => _i26.AddEditQuizView(args.quizzes, key: args.key),
        settings: data,
      );
    },
    _i27.AboutView: (data) {
      return _i28.MaterialPageRoute<dynamic>(
        builder: (context) => const _i27.AboutView(),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class SignUpViewArguments {
  const SignUpViewArguments({
    required this.user,
    this.key,
  });

  final _i29.User? user;

  final _i30.Key? key;

  @override
  String toString() {
    return '{"user": "$user", "key": "$key"}';
  }

  @override
  bool operator ==(covariant SignUpViewArguments other) {
    if (identical(this, other)) return true;
    return other.user == user && other.key == key;
  }

  @override
  int get hashCode {
    return user.hashCode ^ key.hashCode;
  }
}

class StrokesMultiplayerViewArguments {
  const StrokesMultiplayerViewArguments({
    required this.game,
    this.key,
  });

  final _i31.MultiplayerStroke game;

  final _i30.Key? key;

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

  final _i30.Key? key;

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
    required this.isOnline,
    this.key,
  });

  final _i32.Lesson lesson;

  final bool isOnline;

  final _i30.Key? key;

  @override
  String toString() {
    return '{"lesson": "$lesson", "isOnline": "$isOnline", "key": "$key"}';
  }

  @override
  bool operator ==(covariant TopicViewArguments other) {
    if (identical(this, other)) return true;
    return other.lesson == lesson &&
        other.isOnline == isOnline &&
        other.key == key;
  }

  @override
  int get hashCode {
    return lesson.hashCode ^ isOnline.hashCode ^ key.hashCode;
  }
}

class MenuViewArguments {
  const MenuViewArguments({
    required this.user,
    this.key,
  });

  final _i29.User user;

  final _i30.Key? key;

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

class HostStrokeViewArguments {
  const HostStrokeViewArguments({
    required this.game,
    this.key,
  });

  final _i31.MultiplayerStroke game;

  final _i30.Key? key;

  @override
  String toString() {
    return '{"game": "$game", "key": "$key"}';
  }

  @override
  bool operator ==(covariant HostStrokeViewArguments other) {
    if (identical(this, other)) return true;
    return other.game == game && other.key == key;
  }

  @override
  int get hashCode {
    return game.hashCode ^ key.hashCode;
  }
}

class MultiplayerStrokeWaitingRoomViewArguments {
  const MultiplayerStrokeWaitingRoomViewArguments({
    required this.game,
    this.key,
  });

  final _i31.MultiplayerStroke game;

  final _i30.Key? key;

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

  final _i30.Key? key;

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

class AddStrokeLessonViewArguments {
  const AddStrokeLessonViewArguments({
    required this.lesson,
    this.key,
  });

  final _i32.Lesson? lesson;

  final _i30.Key? key;

  @override
  String toString() {
    return '{"lesson": "$lesson", "key": "$key"}';
  }

  @override
  bool operator ==(covariant AddStrokeLessonViewArguments other) {
    if (identical(this, other)) return true;
    return other.lesson == lesson && other.key == key;
  }

  @override
  int get hashCode {
    return lesson.hashCode ^ key.hashCode;
  }
}

class MultiplayerStrokeHostResultsViewArguments {
  const MultiplayerStrokeHostResultsViewArguments({
    required this.game,
    this.key,
  });

  final _i31.MultiplayerStroke game;

  final _i30.Key? key;

  @override
  String toString() {
    return '{"game": "$game", "key": "$key"}';
  }

  @override
  bool operator ==(covariant MultiplayerStrokeHostResultsViewArguments other) {
    if (identical(this, other)) return true;
    return other.game == game && other.key == key;
  }

  @override
  int get hashCode {
    return game.hashCode ^ key.hashCode;
  }
}

class QuizViewArguments {
  const QuizViewArguments({
    required this.game,
    required this.isOnline,
    this.key,
  });

  final _i33.Quizzes game;

  final bool isOnline;

  final _i30.Key? key;

  @override
  String toString() {
    return '{"game": "$game", "isOnline": "$isOnline", "key": "$key"}';
  }

  @override
  bool operator ==(covariant QuizViewArguments other) {
    if (identical(this, other)) return true;
    return other.game == game && other.isOnline == isOnline && other.key == key;
  }

  @override
  int get hashCode {
    return game.hashCode ^ isOnline.hashCode ^ key.hashCode;
  }
}

class AddEditQuizViewArguments {
  const AddEditQuizViewArguments({
    required this.quizzes,
    this.key,
  });

  final _i33.Quizzes? quizzes;

  final _i30.Key? key;

  @override
  String toString() {
    return '{"quizzes": "$quizzes", "key": "$key"}';
  }

  @override
  bool operator ==(covariant AddEditQuizViewArguments other) {
    if (identical(this, other)) return true;
    return other.quizzes == quizzes && other.key == key;
  }

  @override
  int get hashCode {
    return quizzes.hashCode ^ key.hashCode;
  }
}

extension NavigatorStateExtension on _i34.NavigationService {
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

  Future<dynamic> navigateToSignUpView({
    required _i29.User? user,
    _i30.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.signUpView,
        arguments: SignUpViewArguments(user: user, key: key),
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
    _i30.Key? key,
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

  Future<dynamic> navigateToPersonView({
    required String userId,
    _i30.Key? key,
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
    required _i32.Lesson lesson,
    required bool isOnline,
    _i30.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.topicView,
        arguments:
            TopicViewArguments(lesson: lesson, isOnline: isOnline, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToMenuView({
    required _i29.User user,
    _i30.Key? key,
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

  Future<dynamic> navigateToHostStrokeView({
    required _i31.MultiplayerStroke game,
    _i30.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.hostStrokeView,
        arguments: HostStrokeViewArguments(game: game, key: key),
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
    _i30.Key? key,
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
    _i30.Key? key,
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

  Future<dynamic> navigateToAddStrokeLessonView({
    required _i32.Lesson? lesson,
    _i30.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.addStrokeLessonView,
        arguments: AddStrokeLessonViewArguments(lesson: lesson, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToMultiplayerStrokeHostResultsView({
    required _i31.MultiplayerStroke game,
    _i30.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.multiplayerStrokeHostResultsView,
        arguments:
            MultiplayerStrokeHostResultsViewArguments(game: game, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToPracticeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.practiceView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToQuizView({
    required _i33.Quizzes game,
    required bool isOnline,
    _i30.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.quizView,
        arguments: QuizViewArguments(game: game, isOnline: isOnline, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAddEditQuizView({
    required _i33.Quizzes? quizzes,
    _i30.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.addEditQuizView,
        arguments: AddEditQuizViewArguments(quizzes: quizzes, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAboutView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.aboutView,
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

  Future<dynamic> replaceWithSignUpView({
    required _i29.User? user,
    _i30.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.signUpView,
        arguments: SignUpViewArguments(user: user, key: key),
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
    _i30.Key? key,
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

  Future<dynamic> replaceWithPersonView({
    required String userId,
    _i30.Key? key,
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
    required _i32.Lesson lesson,
    required bool isOnline,
    _i30.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.topicView,
        arguments:
            TopicViewArguments(lesson: lesson, isOnline: isOnline, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithMenuView({
    required _i29.User user,
    _i30.Key? key,
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

  Future<dynamic> replaceWithHostStrokeView({
    required _i31.MultiplayerStroke game,
    _i30.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.hostStrokeView,
        arguments: HostStrokeViewArguments(game: game, key: key),
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
    _i30.Key? key,
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
    _i30.Key? key,
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

  Future<dynamic> replaceWithAddStrokeLessonView({
    required _i32.Lesson? lesson,
    _i30.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.addStrokeLessonView,
        arguments: AddStrokeLessonViewArguments(lesson: lesson, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithMultiplayerStrokeHostResultsView({
    required _i31.MultiplayerStroke game,
    _i30.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.multiplayerStrokeHostResultsView,
        arguments:
            MultiplayerStrokeHostResultsViewArguments(game: game, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithPracticeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.practiceView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithQuizView({
    required _i33.Quizzes game,
    required bool isOnline,
    _i30.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.quizView,
        arguments: QuizViewArguments(game: game, isOnline: isOnline, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAddEditQuizView({
    required _i33.Quizzes? quizzes,
    _i30.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.addEditQuizView,
        arguments: AddEditQuizViewArguments(quizzes: quizzes, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAboutView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.aboutView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
