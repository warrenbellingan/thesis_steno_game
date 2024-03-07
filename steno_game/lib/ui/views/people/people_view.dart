import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:steno_game/ui/common/ui_helpers.dart';
import 'package:steno_game/ui/custom_widgets/game_chip.dart';
import 'package:steno_game/ui/custom_widgets/game_empty.dart';
import 'package:steno_game/ui/custom_widgets/game_loading.dart';
import '../../custom_widgets/game_search_textfield.dart';
import '../../custom_widgets/people_card.dart';
import 'people_viewmodel.dart';

class PeopleView extends StackedView<PeopleViewModel> {
  const PeopleView({Key? key}) : super(key: key);

  @override
  Widget builder(BuildContext context,
      PeopleViewModel viewModel,
      Widget? child,) {
    return Column(
      children: [
        GameSearchTextField(),
        SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GameChip(
              label: "Your Friends",
              onClick: viewModel.loadFriends,
            ),
            GameChip(
              label: "Friend Request",
              onClick: () {},
            ),
          ],
        ),
        verticalSpaceSmall,
        SingleChildScrollView(
          child: viewModel.isBusy
              ? const GameLoading(
            label: "Getting users",
          )
              : viewModel.isEmptyUserList
              ? const GameEmpty()
              : ListView.builder(
            itemCount: viewModel.users.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              var user = viewModel.users[index];
              return PeopleCard(
                  name: user.name,
                  level: user.level,
                  isFriend: viewModel.isFriend(user.id),
                  haveFriendRequest: viewModel.haveFriendRequest(user.id),
                  isRequestedFriend: viewModel.isRequestedFriend(user.friendsRequest),
                  btnText: '',
                  onClick: () {
                    viewModel.onClick(user);
                  }, cancelRejectClick: (){},
              );
            },
          ),
        ),
        verticalSpaceSmall,
      ],
    );
  }

  @override
  PeopleViewModel viewModelBuilder(BuildContext context,) =>
      PeopleViewModel();

  @override
  void onViewModelReady(PeopleViewModel viewModel) {
    viewModel.init();
  }
}
