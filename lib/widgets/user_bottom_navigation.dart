import 'package:flutter/material.dart';

import '../resources/colors.dart';
import '../resources/icons.dart';
import '../resources/text_theme.dart';

class UserBottomNavigation extends StatelessWidget {
  const UserBottomNavigation({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0.1,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: IconButton(
            icon: Icon(
              AppIcons.homeIcon,
              color: AppColors.whiteColor,
            ),
            onPressed: () {},
          ),
          title: Text(
            'Home',
            style: TextStyle(
              color: AppColors.whiteColor,
            ),
          ),
        ),
        BottomNavigationBarItem(
          icon: IconButton(
            icon: Icon(
              AppIcons.meetingIcon,
              color: AppColors.whiteColor,
            ),
            onPressed: () {},
          ),
          title: Text(
            'Calendar',
            style: textTheme(context).bodySmall.colorWhite,
          ),
        ),
        BottomNavigationBarItem(
          icon: IconButton(
            icon: Icon(
              AppIcons.teamIcon,
              color: AppColors.whiteColor,
            ),
            onPressed: () {},
          ),
          title: Text(
            'Team',
            style: TextStyle(
              color: AppColors.whiteColor,
            ),
          ),
        ),
        BottomNavigationBarItem(
          icon: IconButton(
            icon: Icon(
              AppIcons.contactIcon,
              color: AppColors.whiteColor,
            ),
            onPressed: () {},
          ),
          title: Text(
            'Contact',
            style: TextStyle(
              color: AppColors.whiteColor,
            ),
          ),
        ),
      ],
    );
  }
}
