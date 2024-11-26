import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:news_app/core/error/failure.dart';
import 'package:news_app/core/utils/api_service.dart';
import 'package:news_app/models/news_model.dart';

class NewsServices {
  final Dio dio;
  final ApiService apiService;
  const NewsServices(this.apiService, {required this.dio});

  final String apikey = "pub_38727029b11b4b1c0d7ab4e389eb57343ba2c";

  Future<Either<Failure, List<NewsModel>>> getCategoryNews(
    String catName,
  ) async {
    try {
      var jsonData = await apiService.get(
        path: "https://newsdata.io/api/1/news?apikey=$apikey&category=$catName",
      );

      final List<dynamic> results = jsonData["results"];

      List<NewsModel> resultsList = [];

      resultsList = results.map((article) {
        return NewsModel.fromJson(article);
      }).toList();
      return right(resultsList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(dioExcepition: e));
      }
      return left(ServerFailure(error: "there was an error,try again later"));
    }
  }

  Future<Either<Failure, List<NewsModel>>> getSearchNews(String name) async {
    if (name == "") {
      return right([]);
    }
    try {
      final jsonData = await apiService.get(
        path: "https://newsdata.io/api/1/news?apikey=$apikey&q=$name",
      );

      final List<dynamic> results = jsonData["results"];

      List<NewsModel> resultsList = [];
      resultsList = results.map((article) {
        return NewsModel.fromJson(article);
      }).toList();

      return right(resultsList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(dioExcepition: e));
      }
      return left(
        ServerFailure(error: " there was an error,try again later"),
      );
    }
  }
}
