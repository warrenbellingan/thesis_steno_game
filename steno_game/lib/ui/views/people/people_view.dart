import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
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
    return SingleChildScrollView(
      child: Column(
        children: [
          GameSearchTextField(),
          SizedBox(
            height: 16,
          ),
          viewModel.isBusy
              ? GameLoading(
                  label: "Getting users",
                )
              : ListView.builder(
                  itemCount: viewModel.users.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    var user = viewModel.users[index];
                    return PeopleCard(
                      name: user.name,
                      level: user.level,
                      onClick: () {
                        viewModel.onClick(user);
                      },
                    );
                  },
                ),
        ],
      ),
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
