import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_intranet_example/resources/icons.dart';
import 'package:flutter_intranet_example/resources/text_theme.dart';
import 'package:flutter_intranet_example/ui/view_models/news_article_view_model.dart';
import 'package:flutter_intranet_example/ui/widgets/horizontal_spacing.dart';
import 'package:flutter_intranet_example/ui/widgets/rounded_corner_image.dart';
import 'package:flutter_intranet_example/ui/widgets/vertical_spacing.dart';

class ArticleScreen extends StatelessWidget {
  final NewsArticleViewModel article;

  const ArticleScreen({@required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          children: <Widget>[
            Icon(
              AppIcons.accountCircleIcon,
              size: 24.0,
            ),
            const HorizontalSpacing(
              width: 5.0,
            ),
            Container(
              constraints: const BoxConstraints(
                maxWidth: 150,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Author',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    article.author ?? 'Undefined',
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Stack(
                  alignment: Alignment.centerLeft,
                  children: <Widget>[
                    const Divider(
                      height: 80,
                      color: Color(0xffFF8A30),
                      thickness: 20,
                    ),
                    Text(
                      ' Headline',
                      style: textTheme(context).bodyMedium.colorWhite,
                    ),
                  ],
                ),
                Text(
                  article.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    wordSpacing: 3,
                  ),
                ),
                const VerticalSpacing(
                  height: 20.0,
                ),
                Text(
                  article.publishedAt,
                  style: textTheme(context).bodyLarge.colorGrey,
                ),
                const VerticalSpacing(
                  height: 30.0,
                ),
                Container(
                  height: 200,
                  child: RoundedCornerImageWidget(
                    imageUrl: article.urlToImages,
                  ),
                ),
                const VerticalSpacing(
                  height: 30.0,
                ),
                Text(
                  article.description ?? "No Contents",
                  style: const TextStyle(
                    fontSize: 16,
                    wordSpacing: 3,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ArticleScreenArguments {
  final NewsArticleViewModel article;

  ArticleScreenArguments({this.article});
}
