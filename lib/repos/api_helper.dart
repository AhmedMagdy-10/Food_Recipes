import 'package:dio/dio.dart';

class ApiHelper {
  final _baseUrl = 'https://dummyjson.com/';
  final Dio _dio;
  ApiHelper(this._dio);

  Future<Map<String, dynamic>> get({required String endPoints}) async {
    var response = await _dio.get('$_baseUrl$endPoints');
    return response.data;
  }
}
