import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../resources/colors.dart';
import '../resources/values.dart';
import '../ui/screens/article_screen.dart';
import '../ui/screens/contacts_screen.dart';
import '../ui/screens/main_screen.dart';
import '../ui/screens/news_screen.dart';
import '../ui/screens/profile_screen.dart';
import '../ui/view_models/bottom_navigation_bar_provider.dart';
import '../ui/view_models/news_article_list_view_model.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => NewsArticleListViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => BottomNavigationBarProvider(),
        )
      ],
      child: MaterialApp(
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
      ),
    );
  }

  Route<dynamic> _getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.root:
        return MaterialPageRoute(
          settings: const RouteSettings(name: Routes.root),
          builder: (_) => MainScreen(),
        );
      case Routes.contacts:
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
      case Routes.newsFeed:
        return MaterialPageRoute(
          settings: const RouteSettings(name: Routes.newsFeed),
          builder: (_) => NewsScreen(),
        );
      case Routes.article:
        final ArticleScreenArguments arguments =
            settings.arguments as ArticleScreenArguments;
        return MaterialPageRoute(
          settings: const RouteSettings(name: Routes.article),
          builder: (_) => ArticleScreen(
            article: arguments.article,
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
