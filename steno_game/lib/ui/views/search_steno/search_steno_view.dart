import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:stacked/stacked.dart';
import 'package:steno_game/ui/common/ui_helpers.dart';
import 'package:steno_game/ui/constants/game_color.dart';
import 'package:steno_game/ui/custom_widgets/game_chip.dart';
import 'package:steno_game/ui/custom_widgets/game_loading.dart';
import 'package:steno_game/ui/custom_widgets/game_network_image.dart';
import 'package:steno_game/ui/custom_widgets/game_search_textfield.dart';

import '../../custom_widgets/game_body.dart';
import 'search_steno_viewmodel.dart';

class SearchStenoView extends StackedView<SearchStenoViewModel> {
  const SearchStenoView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SearchStenoViewModel viewModel,
    Widget? child,
  ) {
    return GameBody(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: viewModel.back,
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: GameColor.primaryColor,
                  ),
                ),
                Expanded(
                  child: GameSearchTextField(
                    controller: viewModel.searchTextController,
                    onClick: viewModel.search,
                    //onClick: viewModel.search,
                  ),
                ),
              ],
            ),
            verticalSpaceSmall,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GameChip(
                  label: "Strokes",
                  onClick: () {
                    viewModel.setSearchType(0);
                  },
                  isSelected: viewModel.searchType == 0,
                ),
                GameChip(
                  label: "Typing",
                  onClick: () {
                    viewModel.setSearchType(1);
                  },
                  isSelected: viewModel.searchType == 1,
                ),
              ],
            ),
            viewModel.isBusy
                ? const GameLoading()
                : Column(
                    children: [
                      viewModel.searchType == 0
                          ? ListView.builder(
                              itemCount: viewModel.strokeList.length,
                              shrinkWrap: true,
                              primary: false,
                              itemBuilder: (context, index) {
                                var item = viewModel.strokeList[index];
                                return Stack(
                                  alignment: Alignment.topRight,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.all(12),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.black,
                                          width: 2,
                                        ),
                                      ),
                                      child: Column(
                                        children: [
                                          GameNetworkImage(
                                            path: item.strokeImage,
                                          ),
                                          Text(
                                            item.text,
                                            style: const TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.w700,
                                              letterSpacing: 1,
                                              wordSpacing: 3,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    if (viewModel.user.role == "Instructor")
                                      Container(
                                        margin: const EdgeInsets.all(18),
                                        decoration: BoxDecoration(
                                            color: Colors.black12,
                                            borderRadius:
                                                BorderRadius.circular(50)),
                                        child: IconButton(
                                          onPressed: viewModel.editStrokeDialog,
                                          icon: const Icon(
                                            Icons.edit,
                                            size: 30,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                  ],
                                );
                              },
                            )
                          : ListView.builder(
                              itemCount: viewModel.typingList.length,
                              shrinkWrap: true,
                              primary: false,
                              itemBuilder: (context, index) {
                                var item = viewModel.typingList[index];
                                return Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 8),
                                  padding: const EdgeInsets.all(2),
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.white,
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 2,
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      Text(
                                        item.text,
                                        style: const TextStyle(
                                          decoration: TextDecoration.underline,
                                          color: Colors.black54,
                                          fontSize: 24,
                                          fontWeight: FontWeight.w700,
                                          letterSpacing: 1,
                                          wordSpacing: 3,
                                        ),
                                      ),
                                      Text(
                                        item.typingKeys.toUpperCase(),
                                        style: const TextStyle(
                                          color: GameColor.primaryColor,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700,
                                          letterSpacing: 1,
                                          wordSpacing: 3,
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              },
                            ),
                    ],
                  ),
          ],
        ),
      ),
      floatingAction: viewModel.user.role == "Instructor"
          ? Container(
              margin: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                  color: GameColor.primaryColor,
                  borderRadius: BorderRadius.circular(50)),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.add,
                  size: 50,
                  color: Colors.white,
                ),
              ),
            )
          : null,
    );
  }

  @override
  SearchStenoViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SearchStenoViewModel();

  @override
  void onViewModelReady(SearchStenoViewModel viewModel) {
    viewModel.init();
  }
}
