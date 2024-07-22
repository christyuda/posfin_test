import 'package:dio/dio.dart';

class DioService {
  final Dio _dio = Dio();

  DioService() {
    _dio.options.baseUrl = 'http://localhost:5000/api/';
  }

  Future<Response> getRequest(String endpoint) async {
    try {
      final response = await _dio.get(endpoint);
      return response;
    } catch (e) {
      throw Exception('Failed to load data: $e');
    }
  }
}
