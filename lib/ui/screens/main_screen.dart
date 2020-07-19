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
    BottomNavigationBarItem(
      icon: Icon(AppIcons.homeIcon),
      title: const Text('Home'),
    ),
    BottomNavigationBarItem(
      icon: Icon(AppIcons.meetingIcon),
      title: const Text('Meeting'),
    ),
    BottomNavigationBarItem(
      icon: Icon(AppIcons.teamIcon),
      title: const Text(
        'Team',
      ),
    ),
    BottomNavigationBarItem(
      icon: Icon(AppIcons.contactIcon),
      title: const Text('Contact'),
    ),
  ];

  final _currentTab = [
    NewsScreen(),
    MeetingScreen(),
    TeamScreen(),
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
