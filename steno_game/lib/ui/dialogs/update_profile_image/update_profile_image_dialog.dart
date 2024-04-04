import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:steno_game/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:steno_game/ui/custom_widgets/dialog_bar.dart';
import 'package:steno_game/ui/custom_widgets/game_button.dart';
import 'package:steno_game/ui/custom_widgets/game_loading.dart';
import '../../constants/game_color.dart';
import 'update_profile_image_dialog_model.dart';

class UpdateProfileImageDialog
    extends StackedView<UpdateProfileImageDialogModel> {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const UpdateProfileImageDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    UpdateProfileImageDialogModel viewModel,
    Widget? child,
  ) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: Colors.white,
      child: viewModel.isBusy
          ? GameLoading()
          : Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                DialogBar(
                  onClick: () => completer(DialogResponse(confirmed: true)),
                  title: "Upload Photo",
                ),
                Container(
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
                verticalSpaceSmall,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      onPressed: () {
                        viewModel.pickImage(ImageSource.camera);
                      },
                      icon: Icon(
                        Icons.camera_alt_rounded,
                        color: GameColor.primaryColor,
                        size: 40,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        viewModel.pickImage(ImageSource.gallery);
                      },
                      icon: Icon(
                        Icons.image,
                        color: GameColor.primaryColor,
                        size: 40,
                      ),
                    ),
                  ],
                ),
                verticalSpaceMedium,
                GameButton(
                  text: "Save",
                  onClick: viewModel.uploadImage, isLoading: viewModel.busy("upload"),
                ),
                verticalSpaceMedium,
              ],
            ),
    );
  }

  @override
  UpdateProfileImageDialogModel viewModelBuilder(BuildContext context) =>
      UpdateProfileImageDialogModel();

  @override
  void onViewModelReady(UpdateProfileImageDialogModel viewModel) {
    viewModel.init();
  }
}
