/// Contains a list of articles from https://newsapi.org service.
///
/// [status] is request status
/// [articles] is a list of articles
/// [totalResults] is the number of articles

class News {
  String status;
  int totalResults;
  List<Article> articles;

  News({this.status, this.totalResults, this.articles});

  News.fromJson(Map<String, dynamic> json)
      : status = json['status'] as String,
        totalResults = json['totalResults'] as int,
        articles = json['articles'] == null
            ? null
            : (json['articles'] as List)
                ?.map((article) =>
                    Article.fromJson(article as Map<String, dynamic>))
                ?.toList();

  Map<String, dynamic> toJson() => {
        'status': status,
        'totalResults': totalResults,
        'articles': articles?.map((article) => article.toJson())?.toList(),
      };

  @override
  String toString() {
    return '{status: $status,\n'
        'totalResults: $totalResults,\n'
        'articles: $articles}';
  }
}

class Article {
  Source source;
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedAt;
  String content;

  Article(
      {this.source,
      this.author,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.publishedAt,
      this.content});

  Article.fromJson(Map<String, dynamic> json)
      : source = json['source'] == null
            ? null
            : Source.fromJson(json['source'] as Map<String, dynamic>),
        author = json['author'] as String,
        title = json['title'] as String,
        description = json['description'] as String,
        url = json['url'] as String,
        urlToImage = json['urlToImage'] as String,
        publishedAt = json['publishedAt'] as String,
        content = json['content'] as String;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'source': source?.toJson(),
        'author': author,
        'title': title,
        'description': description,
        'url': url,
        'urlToImage': urlToImage,
        'publishedAt': publishedAt,
        'content': content,
      };

  @override
  String toString() {
    return '{source: $source,\n'
        'author: $author,\n'
        'title: $title,\n'
        'description: $description,\n'
        'url: $url,\n'
        'urlToImage: $urlToImage,\n'
        'publishedAt: $publishedAt,\n'
        'content: $content}';
  }
}

class Source {
  String id;
  String name;

  Source({this.id, this.name});

  Source.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String,
        id = json['id'] as String;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'name': name,
      };

  @override
  String toString() {
    return '{id: $id,\n'
        'name: $name}';
  }
}
