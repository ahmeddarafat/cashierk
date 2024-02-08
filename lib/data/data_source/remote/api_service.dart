import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../constants/api_constants.dart';

class ApiService {
  final Dio _dio;
  final String baseUrl;

  static Map<String, String> headers = {
    ApiHeaders.contentType: ApiHeaders.applicationJson,
    ApiHeaders.accept: ApiHeaders.applicationJson,
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
    log("the body: $body");
    return await _dio.post(
      endPoint,
      data: body,
      queryParameters: query,
      options: Options(
        headers: token != null ? {"Authorization": "Bearer $token"} : null,
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
        headers: token != null ? {"Authorization": "Bearer $token"} : null,
      ),
    );
  }
}
