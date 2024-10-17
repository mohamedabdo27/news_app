import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:news_app/models/news_model.dart';

class NewsServices {
  final Dio dio;

  const NewsServices({required this.dio});

  final String apikey = "pub_38727029b11b4b1c0d7ab4e389eb57343ba2c";

  Future<List<NewsModel>> getCategoryNews(String catName) async {
    try {
      Response response = await dio.get(
          "https://newsdata.io/api/1/news?apikey=$apikey&category=$catName");

      final Map<String, dynamic> jsonData = response.data;

      final List<dynamic> results = jsonData["results"];

      List<NewsModel> resultsList = [];

      resultsList = results.map((article) {
        return NewsModel.fromJson(article);
      }).toList();
      return resultsList;
    } catch (e) {
      log(e.toString());
      throw ("There was error ,try again later");
    }
  }

  Future<List<NewsModel>> getSearchNews(String name) async {
    if (name == "") {
      return [];
    }
    try {
      Response response = await dio
          .get("https://newsdata.io/api/1/news?apikey=$apikey&q=$name");

      final Map<String, dynamic> jsonData = response.data;

      final List<dynamic> results = jsonData["results"];

      List<NewsModel> resultsList = [];
      resultsList = results.map((article) {
        return NewsModel.fromJson(article);
      }).toList();

      return resultsList;
    } catch (e) {
      throw ("there was error ,try again later");
    }
  }
}
