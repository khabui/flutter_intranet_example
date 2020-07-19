import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      body: NewsGrid(
        articles: listViewModel.articlesViewModels,
      ),
    );
  }
}
