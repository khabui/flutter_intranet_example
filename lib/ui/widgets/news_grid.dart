import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../resources/text_theme.dart';
import '../../resources/values.dart';
import '../screens/article_screen.dart';
import '../view_models/news_article_view_model.dart';
import 'rounded_corner_image.dart';

class NewsGrid extends StatelessWidget {
  final List<NewsArticleViewModel> articles;

  const NewsGrid({@required this.articles});

  void _showArticle(BuildContext context, NewsArticleViewModel vm) {
    Navigator.of(context).pushNamed(Routes.article,
        arguments: ArticleScreenArguments(article: vm));
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: articles.length,
      itemBuilder: (context, index) {
        final article = articles[index];
        return GestureDetector(
          onTap: () => _showArticle(context, article),
          child: GridTile(
            footer: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 16.0,
              ),
              child: Text(
                article.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: textTheme(context).bodyMedium.bold,
              ),
            ),
            child: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 20.0,
              ),
              child: RoundedCornerImageWidget(
                imageUrl: article.urlToImages,
              ),
            ),
          ),
        );
      },
    );
  }
}
