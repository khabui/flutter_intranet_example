import 'dart:convert';

import 'package:flutter/services.dart';

import 'news.dart';

class NewsRepository {
  List<Article> articles = [];

  Future<List<Article>> fetchNews() async {
    final String text = await rootBundle.loadString('assets/mocks/news.json');
    final json = jsonDecode(text);

    final News _temp = News.fromJson(json as Map<String, dynamic>);

    if (_temp.status == 'ok') {
      final articles = _temp.articles;

      return articles;
    } else {
      throw Exception('Failed to fetch news');
    }
  }
}
