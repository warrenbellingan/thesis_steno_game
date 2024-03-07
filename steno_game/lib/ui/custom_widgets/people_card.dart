import 'package:flutter/material.dart';
import 'package:steno_game/ui/custom_widgets/player_profile.dart';
import '../common/ui_helpers.dart';
import '../constants/game_color.dart';
import 'add_friend.dart';

typedef OnClick = Function();

class PeopleCard extends StatelessWidget {
  PeopleCard({
    super.key,
    required this.name,
    required this.level,
    required this.onClick,
    this.image,
    this.btnClick,
    required this.btnText,
    required this.isFriend,
    required this.haveFriendRequest,
    required this.isRequestedFriend, required this.cancelRejectClick,

  });

  final String name;
  final int level;
  final String? image;
  final OnClick? btnClick;
  final OnClick cancelRejectClick;
  final String btnText;
  final OnClick onClick;
  final bool isFriend;
  final bool haveFriendRequest;
  final bool isRequestedFriend;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
        padding: EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [primaryShadow()],
          border: Border.all(
            style: BorderStyle.solid,
            color: GameColor.secondaryColor,
            width: 2,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PlayerProfile(
              name: name,
              level: level,
              imagePath: image,
            ),
            isFriend
                ? Container(
                    padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                    margin: EdgeInsets.symmetric(horizontal: 6),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: GameColor.primaryBackgroundColor,
                    ),
                    child: const Text(
                      'Friends',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )
                : AddFriend(
                    onClick: btnClick, text: btnText,
                  ),
          ],
        ),
      ),
    );
  }
}
