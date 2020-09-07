import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../resources/colors.dart';
import '../../resources/icons.dart';
import '../view_models/bottom_navigation_bar_provider.dart';
import 'contacts_screen.dart';
import 'meeting_screen.dart';
import 'news_screen.dart';
import 'team_screen.dart';

class MainScreen extends StatelessWidget {
  final _tabItems = [
    const BottomNavigationBarItem(
      icon: Icon(AppIcons.homeIcon),
      title: Text('Home'),
    ),
    const BottomNavigationBarItem(
      icon: Icon(AppIcons.meetingIcon),
      title: Text('Meeting'),
    ),
    const BottomNavigationBarItem(
      icon: Icon(AppIcons.teamIcon),
      title: Text(
        'Team',
      ),
    ),
    const BottomNavigationBarItem(
      icon: Icon(AppIcons.contactIcon),
      title: Text('Contact'),
    ),
  ];

  final _currentTab = [
    NewsScreen(),
    const MeetingScreen(
      title: 'Meeting',
    ),
    const TeamScreen(
      title: 'Team',
    ),
    const ContactsScreen(
      title: 'Contacts',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BottomNavigationBarProvider>(context);

    return Scaffold(
      body: _currentTab[provider.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: provider.currentIndex,
        onTap: (index) {
          provider.currentIndex = index;
        },
        selectedItemColor: AppColors.blackColor,
        unselectedItemColor: AppColors.greyColor,
        items: _tabItems,
      ),
    );
  }
}
