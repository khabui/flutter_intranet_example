import 'package:intl/intl.dart';

import '../../models/news.dart';

class NewsArticleViewModel {
  final Article _article;

  NewsArticleViewModel({Article article}) : _article = article;

  String get author => _article.author;

  String get description => _article.description;

  String get publishedAt {
    final dateTime =
        DateFormat('yyyy-MM-ddTHH:mm:ssZ').parse(_article.publishedAt, true);
    return DateFormat.yMMMMEEEEd('en-us').format(dateTime).toString();
  }

  String get title => _article.title;

  String get url => _article.url;

  String get urlToImages => _article.urlToImage;
}
