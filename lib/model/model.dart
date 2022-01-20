class NewsModel {
  String author = '';
  String title = '';
  String description = '';
  String url = "";
  String urlToImage = '';
  String publishedAt = '';
  String content = '';

  NewsModel({
    required this.author,
    required this.content,
    required this.description,
    required this.publishedAt,
    required this.title,
    required this.url,
    required this.urlToImage,
  });
  NewsModel.fromMap(Map<String, dynamic> map) {
    author = map['author'] ?? "No Author";
    title = map['title'] ?? "No title";
    description = map['description'] ?? "No desc";
    url = map['url'] ?? "no url";
    urlToImage = map['urlToImage'] ??
        "https://images.unsplash.com/photo-1471897488648-5eae4ac6686b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwxMXx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60";
    publishedAt = map['publishedAt'] ?? "";
    content = map['content'] ?? "";
  }
}

class NewsModelHindi {
  String title = '';
  String description = '';
  String url = "";
  String image = '';
  String publishedAt = '';
  String content = '';

  NewsModelHindi({
    required this.content,
    required this.description,
    required this.publishedAt,
    required this.title,
    required this.url,
    required this.image,
  });
  NewsModelHindi.fromMap(Map<String, dynamic> map) {
    title = map['title'] ?? "No title";
    description = map['description'] ?? "No desc";
    url = map['url'] ?? "no url";
    image = map['image'] ??
        "https://images.unsplash.com/photo-1471897488648-5eae4ac6686b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwxMXx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60";
    publishedAt = map['publishedAt'] ?? "";
    content = map['content'] ?? "";
  }
}
