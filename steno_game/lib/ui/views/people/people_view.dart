import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
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
          ListView.builder(
            itemCount: 3,
            shrinkWrap: true,
            itemBuilder: (context, index) => PeopleCard(),
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
}
