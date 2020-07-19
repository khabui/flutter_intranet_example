import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_models/news_article_list_view_model.dart';

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
      appBar: AppBar(),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: listViewModel.articlesViewModels.length,
        itemBuilder: (context, index) {
          return Text(listViewModel.articlesViewModels[index].title);
        },
      ),
    );
  }
}
