import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/network/config/api_config.dart';

class ApiService {
  final Dio dio;

  ApiService({required this.dio}) {
    dio.interceptors.add(LogInterceptor(
      request: true,
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
      responseBody: true,
      error: true,
    ));
  }



  Future<dynamic> get({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
  }) async {
    Response response = await dio.get(
      "${ApiConfig.baseUrl}$endPoint",
      queryParameters: queryParameters,
    );
    return response.data;
  }

  Future<dynamic> post({
    required String endPoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    bool isFromData = false,
  }) async {
    Response response = await dio.post(
      "${ApiConfig.baseUrl}$endPoint",
      data: isFromData ? FormData.fromMap(data!) : data,
      queryParameters: queryParameters,
    );
    return response.data;
  }
}
