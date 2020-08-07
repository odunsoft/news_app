import 'dart:convert';
import 'package:newsapp/models/article_model.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticleModel> news = [];

  Future<void> getNews() async {
    String url =
        "http://newsapi.org/v2/top-headlines?country=tr&category=business&apiKey=b6580322ddfe434fa37c638f2b00e0e0";

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {

      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null && element['description'] != null) {

          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            author: element['author'],
            description: element["description"],
            url: element["url"],
            urlToImage: element["urlToImage"],
            content: element["content"],

          );

          news.add(articleModel);
        }
      });
    }
  }
}




class CategoryNewsClass {
  List<ArticleModel> news = [];

  Future<void> getNews(String category) async {
    String url =
        "http://newsapi.org/v2/top-headlines?category=$category&country=tr&category=business&apiKey=b6580322ddfe434fa37c638f2b00e0e0";

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {

      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null && element['description'] != null) {

          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            author: element['author'],
            description: element["description"],
            url: element["url"],
            urlToImage: element["urlToImage"],
            content: element["content"],

          );

          news.add(articleModel);
        }
      });
    }
  }
}
