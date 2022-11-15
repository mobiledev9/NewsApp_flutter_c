// class modelData {
//   var apititle;
//   var apidescription;
//   var apiimage;
//   var apiurl;
//   var apiauthor;

//   modelData({
//     this.apititle = "title",
//     this.apidescription = "desc",
//     this.apiimage = "image",
//     this.apiurl = "url",
//     this.apiauthor = "author",
//   });

//   factory modelData.fromMap(element) {
//     return modelData(
//       apititle: element["title"],
//       apidescription: element["description"] ?? false.toString(),
//       apiimage: element["urlToImage"],
//       apiurl: element["url"],
//       apiauthor: element["author"] ?? false.toString(),
//     );
//   }
// }

// To parse this JSON data, do
//
//     final getData = getDataFromMap(jsonString);

// import 'dart:convert';

// GetData getDataFromMap(String str) => GetData.fromMap(json.decode(str));

// String getDataToMap(GetData data) => json.encode(data.toMap());

// class GetData {
//     GetData({
//         this.status,
//         this.totalResults,
//         this.articles,
//     });

//     String status;
//     int totalResults;
//     List<Article> articles;

//     factory GetData.fromMap(Map<String, dynamic> json) => GetData(
//         status: json["status"],
//         totalResults: json["totalResults"],
//         articles: List<Article>.from(json["articles"].map((x) => Article.fromMap(x))),
//     );

//     Map<String, dynamic> toMap() => {
//         "status": status,
//         "totalResults": totalResults,
//         "articles": List<dynamic>.from(articles.map((x) => x.toMap())),
//     };
// }

class Article {
  Article({
    this.author = "autor",
    this.title = "Autor",
    this.description = "Autor",
    this.urlToImage = "autor",
    this.url = "",
    this.publishedAt = "autor",
    this.content = "autor",
    // this.source,
  });

  String author;
  String title;
  String description;
  String urlToImage;
  String url;
  String publishedAt;
  String content;
  // Source source;// Source source;

  factory Article.fromMap(element) => Article(
        author: element["author"] ?? "",
        title: element["title"] ?? false.toString(),
        description: element["description"] ?? false.toString(),
        url: element["url"],
        urlToImage: element["urlToImage"] ?? false.toString(),
        publishedAt: element["publishedAt"],
        content: element["content"],
        // source: Source.fromMap(json["source"]),
      );

  Map<String, dynamic> toMap() => {
        // "author": author == null ? null : author,
        "title": title,
        "description": description == null ? null : description,
        "urlToImage": urlToImage == null ? null : urlToImage,
        "content": content,
        // "publishedAt": publishedAt.toIso8601String(),
        // "source": source.toMap(),
        // "url": url,
      };
}

// class Source {
//   Source({
//     this.id,
//     this.name,
//   });

//   String id;
//   String name;

//   factory Source.fromMap(Map<String, dynamic> json) => Source(
//         id: json["id"] == null ? null : json["id"],
//         name: json["name"],
//       );

//   Map<String, dynamic> toMap() => {
//         "id": id == null ? null : id,
//         "name": name,
//       };
// }
