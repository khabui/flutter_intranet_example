import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';

import '../../models/random_user_api.dart';
import '../../resources/colors.dart';
import '../../resources/icons.dart';
import '../../resources/text_theme.dart';
import 'user_list_tile.dart';

class UserCard extends StatelessWidget {
  final User user;

  const UserCard({Key key, @required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FocusedMenuHolder(
      onPressed: () {},
      menuWidth: MediaQuery.of(context).size.width * 0.5,
      duration: const Duration(milliseconds: 250),
      menuItems: <FocusedMenuItem>[
        FocusedMenuItem(
          title: Text(
            'Mail to ${user.name.first}',
            style: textTheme(context).bodyMedium.colorBlack,
            overflow: TextOverflow.ellipsis,
          ),
          onPressed: () {},
          trailingIcon: Icon(AppIcons.emailIcon),
        ),
        FocusedMenuItem(
          title: Text(
            'Open',
            style: textTheme(context).bodyMedium.colorBlack,
          ),
          onPressed: () {},
          trailingIcon: Icon(AppIcons.openIcon),
        ),
        FocusedMenuItem(
          title: Text(
            'Share',
            style: textTheme(context).bodyMedium.colorBlack,
          ),
          onPressed: () {},
          trailingIcon: Icon(AppIcons.shareIcon),
        ),
      ],
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 6.0,
        ),
        decoration: BoxDecoration(
          color: AppColors.atollColor,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: AppColors.greyColor,
          ),
        ),
        child: UserListTile(
          user: user,
        ),
      ),
    );
  }
}
