import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../resources/colors.dart';
import '../../resources/text_theme.dart';
import '../view_models/news_article_list_view_model.dart';
import '../widgets/news_grid.dart';

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<NewsArticleListViewModel>(context, listen: false).fetchData();
  }

  @override
  Widget build(BuildContext context) {
    final listViewModel = Provider.of<NewsArticleListViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          'News Feed',
          style: textTheme(context).heading2.colorWhite,
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'News',
                style: textTheme(context).heading2.bold.colorWhite,
              ),
            ),
            Divider(
              color: AppColors.whiteColor,
              height: 36.0,
              thickness: 8,
              indent: 16.0,
              endIndent: 16.0,
            ),
            Expanded(
              child: NewsGrid(
                articles: listViewModel.articlesViewModels,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
