import 'package:dio/dio.dart';

class ApiService {
  ApiService({
    required this.dio,
  });
  final Dio dio;
  Future<Map<String, dynamic>> get({
    required String path,
  }) async {
    Response response = await dio.get(
      path,
    );
    return response.data;
  }
}
