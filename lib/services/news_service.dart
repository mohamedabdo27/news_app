import 'package:dio/dio.dart';
import 'package:news_app/models/custom_container1.dart';

class NewsServices {
  final Dio dio;

  const NewsServices(this.dio);

  Future<List<Container1Model>> getCategoryNews(String catName) async {
    try {
      Response response = await dio.get(
          "https://newsdata.io/api/1/news?apikey=pub_38727029b11b4b1c0d7ab4e389eb57343ba2c&category=$catName");

      final Map<String, dynamic> jsonData = response.data;

      final List<dynamic> results = jsonData["results"];

      List<Container1Model> resultsList = [];
      resultsList = results.map((article) {
        return Container1Model(
            link: article["link"],
            image: article["image_url"],
            text1: article["title"],
            text2: article["description"],
            text3: article["pubDate"]);
      }).toList();
      return resultsList;
    } catch (e) {
      throw ("There was error ,try again later");
    }
  }

  Future<List<Container1Model>> getTopNews() async {
    try {
      Response response = await dio.get(
          "https://newsdata.io/api/1/news?apikey=pub_38727029b11b4b1c0d7ab4e389eb57343ba2c&category=top");

      final Map<String, dynamic> jsonData = response.data;

      final List<dynamic> results = jsonData["results"];

      List<Container1Model> resultsList = [];
      resultsList = results.map((article) {
        return Container1Model(
            link: article["link"],
            image: article["image_url"],
            text1: article["title"],
            text2: article["description"],
            text3: article["pubDate"]);
      }).toList();
      return resultsList;
    } on DioException catch (e) {
      throw ("There was error ,try again later");
    }
  }

  Future<List<Container1Model>> getSearchNews(String name) async {
    if (name == "") {
      return [];
    }
    try {
      Response response = await dio.get(
          "https://newsdata.io/api/1/news?apikey=pub_38727029b11b4b1c0d7ab4e389eb57343ba2c&q=$name");

      final Map<String, dynamic> jsonData = response.data;

      final List<dynamic> results = jsonData["results"];

      List<Container1Model> resultsList = [];
      resultsList = results.map((article) {
        return Container1Model(
            link: article["link"],
            image: article["image_url"],
            text1: article["title"],
            text2: article["description"],
            text3: article["pubDate"]);
      }).toList();
      return resultsList;
    } catch (e) {
      throw ("there was error ,try again later");
    }
  }
}
