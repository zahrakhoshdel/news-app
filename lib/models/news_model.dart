class Articles {
  String? title;
  String? description;
  String? urlImage;

  Articles({
    this.title,
    this.description,
    this.urlImage,
  });

  Articles.fromJson(Map<String, dynamic> json) {
    title = json["title"];
    description = json["description"];
    urlImage = json["urlToImage"];
  }
}

class NewsModel {
  List<Articles>? articles;

  NewsModel({this.articles});

  NewsModel.fromJson(Map<String, dynamic> json) {
    articles = (json["articles"] as List<dynamic>)
        .map((dynamic e) => Articles.fromJson(e))
        .toList();
  }
}
