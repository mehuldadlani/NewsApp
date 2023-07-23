class ArticleDataModel {
  Source source;
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedAt;
  String content;

  ArticleDataModel({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory ArticleDataModel.fromJson(Map<String, dynamic> json) {
    return ArticleDataModel(
      source: Source.fromJson(json['source']),
      author: json['author'] as String? ?? 'Unknown', 
      title: json['title'] as String? ?? 'No Title', 
      description: json['description'] as String? ?? 'No Description', 
      url: json['url'] as String? ?? '', 
      urlToImage: json['urlToImage'] as String? ?? '', 
      publishedAt: json['publishedAt'] as String? ?? '', 
      content: json['content'] as String? ?? '', 
    );
  }
}

class Source {
  String? id;
  String name;

  Source({this.id, required this.name});

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(
      id: json['id'] as String?,
      name: json['name'] as String,
    );
  }
}
