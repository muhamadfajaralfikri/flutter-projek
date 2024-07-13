import 'dart:convert';

List<Artikelmodel> parseArticles(String? json) {
  if (json == null) {
    return [];
  }
  final List parsed = jsonDecode(json);
  return parsed.map((json) => Artikelmodel.fromJson(json)).toList();
}

class Artikelmodel {
  String judul;
  String author;
  String rating;
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedAt;
  String content;

  Artikelmodel({
    required this.judul,
    required this.author,
    required this.rating,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory Artikelmodel.fromJson(Map<String, dynamic> json) => Artikelmodel(
        judul: json["judul"],
        author: json["author"],
        rating: json["rating"],
        title: json["title"],
        description: json["description"],
        url: json["url"],
        urlToImage: json["urlToImage"],
        publishedAt: json["publishedAt"],
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "judul": judul,
        "author": author,
        "rating": rating,
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImage,
        "publishedAt": publishedAt,
        "content": content,
      };
}
