import 'package:steno_game/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:steno_game/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:steno_game/ui/views/home/home_view.dart';
import 'package:steno_game/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:steno_game/services/authentication_service.dart';
import 'package:steno_game/services/shared_preference_service.dart';
import 'package:steno_game/services/image_service.dart';
import 'package:steno_game/ui/views/login/login_view.dart';
import 'package:steno_game/ui/views/sign_up/sign_up_view.dart';
import 'package:steno_game/ui/views/forgot_password/forgot_password_view.dart';
import 'package:steno_game/ui/views/home/home_view.dart';
import 'package:steno_game/ui/views/achievement/achievement_view.dart';
import 'package:steno_game/ui/views/lessons/lessons_view.dart';
import 'package:steno_game/ui/views/people/people_view.dart';
import 'package:steno_game/ui/views/picture_quiz/picture_quiz_view.dart';
import 'package:steno_game/ui/views/picture_topic/picture_topic_view.dart';
import 'package:steno_game/ui/views/play/play_view.dart';
import 'package:steno_game/ui/views/profile/profile_view.dart';
import 'package:steno_game/ui/views/quiz_game_stroke/quiz_game_stroke_view.dart';
import 'package:steno_game/ui/views/stroke_exercise/stroke_exercise_view.dart';
import 'package:steno_game/ui/views/strokes_multiplayer/strokes_multiplayer_view.dart';
import 'package:steno_game/ui/views/stroke_play/stroke_play_view.dart';
import 'package:steno_game/ui/views/text_quiz/text_quiz_view.dart';
import 'package:steno_game/ui/views/text_topic/text_topic_view.dart';
import 'package:steno_game/ui/views/text_exercise/text_exercise_view.dart';
import 'package:steno_game/ui/views/typing_exercise/typing_exercise_view.dart';
import 'package:steno_game/ui/views/typing_play/typing_play_view.dart';
import 'package:steno_game/ui/views/speed_typing/speed_typing_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: SignUpView),
    MaterialRoute(page: ForgotPasswordView),
    MaterialRoute(page: HomeView),
    MaterialRoute(page: AchievementView),
    MaterialRoute(page: LessonsView),
    MaterialRoute(page: PeopleView),
    MaterialRoute(page: PictureQuizView),
    MaterialRoute(page: PictureTopicView),
    MaterialRoute(page: PlayView),
    MaterialRoute(page: ProfileView),
    MaterialRoute(page: QuizGameStrokeView),
    MaterialRoute(page: StrokeExerciseView),
    MaterialRoute(page: StrokesMultiplayerView),
    MaterialRoute(page: StrokePlayView),
    MaterialRoute(page: TextQuizView),
    MaterialRoute(page: TextTopicView),
    MaterialRoute(page: TextExerciseView),
    MaterialRoute(page: TypingExerciseView),
    MaterialRoute(page: TypingPlayView),
    MaterialRoute(page: SpeedTypingView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: AuthenticationService),
    LazySingleton(classType: SharedPreferenceService),
    LazySingleton(classType: ImageService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
