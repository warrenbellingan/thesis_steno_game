import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:stacked/stacked.dart';
import 'package:steno_game/ui/common/ui_helpers.dart';
import 'package:steno_game/ui/custom_widgets/game_icon_button.dart';
import 'package:steno_game/ui/custom_widgets/game_loading.dart';
import '../../constants/game_color.dart';
import '../../custom_widgets/game_bar.dart';
import '../../custom_widgets/game_body.dart';
import '../../custom_widgets/game_button.dart';
import '../../custom_widgets/profile_card.dart';
import 'profile_viewmodel.dart';

class ProfileView extends StackedView<ProfileViewModel> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ProfileViewModel viewModel,
    Widget? child,
  ) {
    return GameBody(
        body: viewModel.isBusy
            ? GameLoading(
                label: "Loading Profile",
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    GameBar(),
                    Row(
                      children: [
                        InkWell(
                          borderRadius: BorderRadius.circular(50),
                          onTap: viewModel.showUploadPictureDialog,
                          child: AbsorbPointer(
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black,
                                  style: BorderStyle.solid,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: CircleAvatar(
                                radius: 50,
                                backgroundImage: viewModel.getImage(),
                                backgroundColor: GameColor.secondaryColor,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 160,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Text(
                                      viewModel.user.name,
                                      style: TextStyle(
                                        fontSize: 20,
                                        height: 1,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  GameIconButton(
                                    onClick: viewModel.showUpdateNameDialog,
                                    icon:
                                        Icons.drive_file_rename_outline_rounded,
                                    size: 30,
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              viewModel.user.role,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              "Level ${viewModel.user.level.toString()}",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Container(
                              height: 10,
                              width: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: GameColor.primaryColor),
                            ),
                          ],
                        )
                      ],
                    ),
                    verticalSpaceMedium,
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: GameColor.secondaryColor,
                          width: 1,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Email: ${viewModel.user.email}",
                            style: TextStyle(fontSize: 16),
                          ),
                          GameIconButton(
                              onClick: viewModel.showUpdateEmailDialog, icon: Icons.edit_rounded)
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: viewModel.showUpdatePasswordDialog,
                      style: ElevatedButton.styleFrom(
                        shape:  RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side:  const BorderSide(
                            color: Colors.black,
                            style: BorderStyle.solid,
                            width: 2,
                          ),
                        ),
                        backgroundColor: Colors.white,
                        shadowColor: Colors.grey,

                      ),
                      child: const Text(
                        "Change Password",
                        style: TextStyle(
                          color: Colors.black,
                          letterSpacing: 1,
                          wordSpacing: 2,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    verticalSpaceSmall,
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ProfileCard(
                                title: "Score",
                                stats: viewModel.user.score.toString()),
                            ProfileCard(
                                title: "Typing Speed",
                                stats:
                                    "${viewModel.user.typingSpeed.toString()}wpm"),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ProfileCard(
                                title: "Achievements",
                                stats: viewModel.user.achievements.length
                                    .toString()),
                            ProfileCard(
                                title: "Typing Accuracy",
                                stats:
                                    "${viewModel.user.typingAccuracy.toString()}%"),
                          ],
                        ),
                      ],
                    ),
                    verticalSpaceMedium,
                    GameButton(text: 'Log out', onClick: viewModel.logOut),
                  ],
                ),
              ));
  }

  @override
  ProfileViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ProfileViewModel();

  @override
  void onViewModelReady(ProfileViewModel viewModel) {
    viewModel.init();
  }
}
