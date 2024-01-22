class News {
  final String id;
  final String title;
  final String description;
  final String source;
  final String imageUrl;
  final String createTimeUtc;

  News({
    required this.id,
    required this.title,
    required this.description,
    required this.source,
    required this.imageUrl,
    required this.createTimeUtc,
  });

  factory News.fromJson(String newsId, Map<String, dynamic> json) {
    return News(
      createTimeUtc: json['createTimeUtc'],
      description: json['description'],
      imageUrl: json['imageUrl'],
      source: json['source'],
      title: json['title'],
      id: newsId,
    );
  }
}
