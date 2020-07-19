import 'package:flutter/material.dart';

import '../resources/colors.dart';
import '../resources/values.dart';
import '../ui/screens/contacts_screen.dart';
import '../ui/screens/profile_screen.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Random User Generator',
      theme: ThemeData(
        canvasColor: AppColors.atollColor,
        scaffoldBackgroundColor: AppColors.atollColor,
        primaryColor: AppColors.atollColor,
        primarySwatch: AppColors.swatchColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: Routes.root,
      onGenerateRoute: (settings) => _getRoute(settings),
    );
  }

  Route<dynamic> _getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.root:
        return MaterialPageRoute(
          settings: const RouteSettings(name: Routes.root),
          builder: (_) => const ContactsScreen(title: 'Contacts'),
        );
      case Routes.profile:
        final ProfileScreenArguments arguments =
            settings.arguments as ProfileScreenArguments;
        return MaterialPageRoute(
          builder: (_) => ProfileScreen(
            user: arguments.user,
          ),
        );
//    case Routes.editProfile:
//      final EditProfileScreenArguments arguments =
//          settings.arguments as EditProfileScreenArguments;
//      return MaterialPageRoute(
//        builder: (_) => EditProfileScreen(user: arguments.user),
//      );
      default:
        throw Exception('Route ${settings.name} is not defined');
    }
  }
}
