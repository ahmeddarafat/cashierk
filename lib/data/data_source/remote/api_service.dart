import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class EndPoints {
  EndPoints._();

  static const serverBaseUrl = "https://cashierc.pharmaco-medica.com/api";
  static const paymentBaseUrl = "https://cashierc.pharmaco-medica.com/api";

  /// order
  static const login = "/auth/login";
  static const register = "/auth/register";
  static const profile = "/auth/user-profile";
  static const logout = "/auth/logout";

  /// order
  static const newOrder = "/orders";
}

class Headers {
  Headers._();

  static const contentType = "content-type";
  static const applicationJson = "application/json";
  static const accept = "accept";
}

class ApiService {
  final Dio _dio;
  final String baseUrl;

  static Map<String, String> headers = {
    Headers.contentType: Headers.applicationJson,
    Headers.accept: Headers.applicationJson,
  };

  ApiService(this.baseUrl)
      : _dio = Dio(
          BaseOptions(
            baseUrl: baseUrl,
            headers: headers,
            receiveDataWhenStatusError: true,
            connectTimeout: const Duration(milliseconds: 3600),
            receiveTimeout: const Duration(milliseconds: 3600),
          ),
        ) {
    if (!kReleaseMode) {
      _dio.interceptors.add(
        // Pretty Dio logger is a Dio interceptor that logs network calls in a pretty, easy to read format.
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
        ),
      );
    }
  }

  Future<Response> getData({
    required String endPoint,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    return await _dio.get(
      endPoint,
      queryParameters: query,
      options: Options(
        headers: {"Authorization": "Bearer $token"},
      ),
    );
  }

  Future<Response> postData({
    required String endPoint,
    required Map<String, dynamic> body,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    return await _dio.post(
      endPoint,
      data: body,
      queryParameters: query,
      options: Options(
        headers: {"Authorization": "Bearer $token"},
      ),
    );
  }

  Future<Response> deleteData({
    required String endPoint,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    return await _dio.delete(
      endPoint,
      queryParameters: query,
      options: Options(
        headers: {"Authorization": "Bearer $token"},
      ),
    );
  }
}
