import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
  Widget builder(
    BuildContext context,
    PeopleViewModel viewModel,
    Widget? child,
  ) {
    return Column(
      children: [
        GameSearchTextField(
          controller: viewModel.searchController,
          onClick: viewModel.searchUsers,
        ),
        verticalSpaceSmall,
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GameChip(
                label: "All",
                onClick: viewModel.loadAllUsers,
                isSelected: viewModel.chipSelectedIndex == 0 ? true : false,
              ),
              horizontalSpaceSmall,
              GameChip(
                label: "Your Friends",
                onClick: viewModel.loadFriends,
                isSelected: viewModel.chipSelectedIndex == 1 ? true : false,
              ),
              horizontalSpaceSmall,
              GameChip(
                label: "Friend Request",
                onClick: viewModel.loadFriendsRequest,
                isSelected: viewModel.chipSelectedIndex == 2 ? true : false,
              ),
            ],
          ),
        ),
        verticalSpaceSmall,
        viewModel.isBusy
            ? const GameLoading(
                label: "Getting users",
              )
            : viewModel.isEmptyUserList
                ? const GameEmpty()
                : Expanded(
                    child: ListView.builder(
                        itemCount: viewModel.users.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          var user = viewModel.users[index];
                          return PeopleCard(
                            name: user.name,
                            level: user.level,
                            image: user.image,
                            isStudent: user.role == "Student" ? null : true,
                            onClick: () => user.id == viewModel.user.id
                                ? viewModel.goToProfile()
                                : viewModel.onClick(user.id),
                          );
                        }),
                  ),
        verticalSpaceSmall,
      ],
    );
  }

  @override
  PeopleViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      PeopleViewModel();

  @override
  void onViewModelReady(PeopleViewModel viewModel) {
    viewModel.init();
  }
}
