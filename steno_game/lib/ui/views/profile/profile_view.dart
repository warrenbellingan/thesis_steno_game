import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:steno_game/ui/common/ui_helpers.dart';
import 'package:steno_game/ui/custom_widgets/game_loading.dart';
import '../../constants/game_color.dart';
import '../../constants/game_png.dart';
import '../../custom_widgets/game_bar.dart';
import '../../custom_widgets/game_body.dart';
import '../../custom_widgets/game_button.dart';
import '../../custom_widgets/game_edit_profile_button.dart';
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
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                              style: BorderStyle.solid,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              CircleAvatar(
                                radius: 50,
                                backgroundImage: viewModel.getImage(),
                                backgroundColor: GameColor.secondaryColor,
                              ),
                              IconButton(
                                visualDensity: VisualDensity.compact,
                                alignment: Alignment.bottomCenter,
                                onPressed: viewModel.showUploadDialog,
                                icon: Icon(
                                  Icons.edit_rounded,
                                  color: GameColor.secondaryBackgroundColor,
                                  size: 30,
                                  shadows: [primaryShadow()],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              viewModel.user.name,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
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
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 4),
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 4, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: GameColor.secondaryColor,
                          width: 1,
                        ),
                      ),
                      child: Text(
                        "Email: ${viewModel.user.email}",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 4),
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 4, vertical: 6),
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
                            "Friends: ${viewModel.user.friends.length}",
                            style: TextStyle(fontSize: 16),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 4, horizontal: 6),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: Colors.grey),
                            child: Text(
                              "View Friends",
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    GameEditProfileButton(
                      title: "Edit Profile",
                      onclick: () {},
                    ),
                    GameEditProfileButton(
                      title: "Change Password",
                      onclick: () {},
                    ),
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
