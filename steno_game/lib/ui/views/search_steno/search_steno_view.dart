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
import 'package:steno_game/ui/custom_widgets/stroke_image.dart';

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
      body: Column(
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
          viewModel.isBusy
              ? const GameLoading()
              : Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ListView.builder(
                          itemCount: viewModel.strokeList.length,
                          shrinkWrap: true,
                          primary: false,
                          itemBuilder: (context, index) {
                            var item = viewModel.strokeList[index];
                            return Stack(
                              alignment: Alignment.topRight,
                              children: [
                                StrokeImage(imagePath: item.strokeImage, word: item.text),
                                if (viewModel.user.role == "Instructor")
                                  Container(
                                    margin: const EdgeInsets.all(18),
                                    decoration: BoxDecoration(
                                        color: Colors.black12,
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    child: IconButton(
                                      onPressed: () {
                                        viewModel.editStrokeDialog(item);
                                      },
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
                      ],
                    ),
                  ),
                ),
        ],
      ),
      floatingAction: viewModel.isBusy
          ? null
          : viewModel.user.role == "Instructor"
              ? Container(
                  margin: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                      color: GameColor.primaryColor,
                      borderRadius: BorderRadius.circular(50)),
                  child: IconButton(
                    onPressed: viewModel.addSteno,
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
