import 'package:flutter/material.dart';

import '../../models/news.dart';
import '../../models/news_repository.dart';
import 'news_article_view_model.dart';

enum LoadingStatus { completed, loading, empty }

class NewsArticleListViewModel with ChangeNotifier {
  LoadingStatus loadingStatus = LoadingStatus.empty;
  List<NewsArticleViewModel> articlesViewModels = <NewsArticleViewModel>[];

  Future<void> fetchData() async {
    final List<Article> articles = await NewsRepository().fetchNews();
    loadingStatus = LoadingStatus.loading;
    notifyListeners();

    articlesViewModels = articles
        .map((article) => NewsArticleViewModel(article: article))
        .toList();
    if (articlesViewModels.isEmpty) {
      loadingStatus = LoadingStatus.empty;
    } else {
      loadingStatus = LoadingStatus.completed;
    }
    notifyListeners();
  }
}
