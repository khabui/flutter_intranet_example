import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_intranet_example/resources/text_theme.dart';

import '../view_models/news_article_view_model.dart';
import 'rounded_corner_image.dart';

class NewsGrid extends StatelessWidget {
  final List<NewsArticleViewModel> articles;

  const NewsGrid({@required this.articles});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: articles.length,
      itemBuilder: (context, index) {
        final article = articles[index];
        return GridTile(
          footer: Container(
            margin: const EdgeInsets.symmetric(horizontal: 8.0,),
            child: Text(
              article.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: textTheme(context).bodyMedium.bold,
            ),
          ),
          child: Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 8.0,
              vertical: 20.0,
            ),
            child: RoundedCornerImageWidget(
              imageUrl: article.urlToImages,
            ),
          ),
        );
      },
    );
  }
}
