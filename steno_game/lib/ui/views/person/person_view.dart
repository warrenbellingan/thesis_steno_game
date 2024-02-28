import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:steno_game/ui/common/ui_helpers.dart';
import 'package:steno_game/ui/custom_widgets/game_bar.dart';
import 'package:steno_game/ui/custom_widgets/game_body.dart';
import '../../../model/user.dart';
import '../../constants/game_color.dart';
import '../../custom_widgets/profile_card.dart';
import 'person_viewmodel.dart';

class PersonView extends StackedView<PersonViewModel> {
  const PersonView(this.user, {Key? key}) : super(key: key);

  final User user;

  @override
  Widget builder(
    BuildContext context,
    PersonViewModel viewModel,
    Widget? child,
  ) {
    return GameBody(
      body: SingleChildScrollView(
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
                      borderRadius: BorderRadius.circular(100)),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: viewModel.getImage(),
                    backgroundColor: GameColor.secondaryColor,
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
                  ],
                )
              ],
            ),
            Container(
              margin: EdgeInsets.all(8),
              alignment: Alignment.centerLeft,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shadowColor: Colors.grey,
                    side: BorderSide(
                      color: GameColor.primaryColor,
                      style: BorderStyle.solid,
                      width: 2,
                    )),
                onPressed: () {},
                child: Text(
                  "Add Friend",
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
            verticalSpaceMedium,
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ProfileCard(
                        title: "Score", stats: viewModel.user.score.toString()),
                    ProfileCard(
                        title: "Typing Speed",
                        stats: "${viewModel.user.typingSpeed.toString()}wpm"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ProfileCard(
                        title: "Achievements",
                        stats: viewModel.user.achievements.length.toString()),
                    ProfileCard(
                        title: "Typing Accuracy",
                        stats: "${viewModel.user.typingAccuracy.toString()}%"),
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
      PersonViewModel(user);
}
