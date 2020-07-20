import '../../models/news.dart';

class NewsArticleViewModel {
  final Article _article;

  NewsArticleViewModel({Article article}) : _article = article;

  String get author => _article.author;

  String get description => _article.description;

  String get publishedAt => _article.publishedAt;

  String get title => _article.title;

  String get url => _article.url;

  String get urlToImages => _article.urlToImage;
}
