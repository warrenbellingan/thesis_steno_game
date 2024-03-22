import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:steno_game/ui/common/ui_helpers.dart';
import 'package:steno_game/ui/custom_widgets/game_bar.dart';
import 'package:steno_game/ui/custom_widgets/game_body.dart';
import 'package:steno_game/ui/custom_widgets/game_loading.dart';
import '../../constants/game_color.dart';
import '../../custom_widgets/profile_card.dart';
import 'person_viewmodel.dart';

class PersonView extends StackedView<PersonViewModel> {
  const PersonView(this.userId, {Key? key}) : super(key: key);

  final String userId;

  @override
  Widget builder(
    BuildContext context,
    PersonViewModel viewModel,
    Widget? child,
  ) {
    return GameBody(
      body: SingleChildScrollView(
        child: viewModel.isBusy
            ? const GameLoading()
            : Column(
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
                            borderRadius: BorderRadius.circular(100)),
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage: viewModel.getImage(),
                          backgroundColor: GameColor.secondaryColor,
                        ),
                      ),
                      horizontalSpaceSmall,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            viewModel.viewedUser.name,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            viewModel.viewedUser.role,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            "Level ${viewModel.viewedUser.level.toString()}",
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  viewModel.relationship == 0
                      ? Container(
                          margin: const EdgeInsets.all(8),
                          alignment: Alignment.centerLeft,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shadowColor: Colors.grey,
                              side: const BorderSide(
                                color: GameColor.primaryColor,
                                style: BorderStyle.solid,
                                width: 2,
                              ),
                            ),
                            onPressed: viewModel.friendRequest,
                            child: const Text(
                              "Add Friend",
                              style: TextStyle(
                                color: GameColor.primaryColor,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                              ),
                            ),
                          ),
                        )
                      : viewModel.relationship == 3
                          ? Row(
                              children: [
                                Container(
                                  margin: const EdgeInsets.all(8),
                                  alignment: Alignment.centerLeft,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shadowColor: Colors.grey,
                                      side: const BorderSide(
                                        color: GameColor.primaryColor,
                                        style: BorderStyle.solid,
                                        width: 2,
                                      ),
                                    ),
                                    onPressed: viewModel.addFriend,
                                    child: const Text(
                                      "Confirm",
                                      style: TextStyle(
                                        color: GameColor.primaryColor,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.all(8),
                                  alignment: Alignment.centerLeft,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shadowColor: Colors.grey,
                                      side: const BorderSide(
                                        color: Colors.red,
                                        style: BorderStyle.solid,
                                        width: 2,
                                      ),
                                    ),
                                    onPressed: viewModel.removeFriendRequest,
                                    child: const Text(
                                      "Remove",
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : viewModel.relationship == 2
                              ? Container(
                                  margin: const EdgeInsets.all(8),
                                  alignment: Alignment.centerLeft,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shadowColor: Colors.grey,
                                      side: const BorderSide(
                                        color: Colors.red,
                                        style: BorderStyle.solid,
                                        width: 2,
                                      ),
                                    ),
                                    onPressed: viewModel.cancelFriendRequest,
                                    child: const Text(
                                      "Cancel Friend Request",
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1,
                                      ),
                                    ),
                                  ),
                                )
                              : Row(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.all(8),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12, vertical: 4),
                                      alignment: Alignment.centerLeft,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: GameColor.primaryColor,
                                      ),
                                      child: const Row(
                                        children: [
                                          Icon(
                                            Icons.check,
                                            color: Colors.white,
                                          ),
                                          Text(
                                            "Friends",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 1,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.all(8),
                                      alignment: Alignment.centerLeft,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          shadowColor: Colors.grey,
                                          side: const BorderSide(
                                            color: Colors.red,
                                            style: BorderStyle.solid,
                                            width: 2,
                                          ),
                                        ),
                                        onPressed: viewModel.unfriend,
                                        child: const Text(
                                          "Unfriend",
                                          style: TextStyle(
                                            color: Colors.red,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 1,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                  verticalSpaceMedium,
                  if (viewModel.isStudent())
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ProfileCard(
                                title: "Score",
                                stats: viewModel.viewedUser.score.toString()),
                            ProfileCard(
                                title: "Typing Speed",
                                stats:
                                    "${viewModel.viewedUser.typingSpeed.toString()}wpm"),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ProfileCard(
                                title: "Achievements",
                                stats: viewModel.viewedUser.achievements.length
                                    .toString()),
                            ProfileCard(
                                title: "Typing Accuracy",
                                stats:
                                    "${viewModel.viewedUser.typingAccuracy.toString()}%"),
                          ],
                        ),
                      ],
                    ),
                ],
              ),
      ),
    );
  }

  @override
  PersonViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      PersonViewModel(userId);

  @override
  void onViewModelReady(PersonViewModel viewModel) {
    viewModel.init();
  }
}
