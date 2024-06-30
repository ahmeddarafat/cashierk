import 'dart:developer';

import 'package:dio/dio.dart';

import '../constants/api_constants.dart';
import '../data_source/local/app_prefs.dart';
import '../network/error_handler.dart';

import '../data_source/remote/api_service.dart';
import '../models/auth_request.dart';
import '../models/auth_response.dart';
import '../network/custom_exception.dart';
import '../network/network_info.dart';

class AuthRepository {
  final NetworkInfo _networkInfo;
  late final ApiService _apiService;
  late final AppPrefs appPrefs;

  AuthRepository({
    required NetworkInfo networkInfo,
    required this.appPrefs,
  }) : _networkInfo = networkInfo {
    _apiService = ApiService(EndPoints.serverBaseUrl);
  }

  Future<AuthResponse> login(LoginRequest request) async {
    if (await _networkInfo.isConnected) {
      try {
        var response = await _apiService.postData(
          endPoint: EndPoints.login,
          body: {
            ApiConstants.email: request.email,
            ApiConstants.password: request.password,
          },
        );
        return AuthResponse.fromJson(response.data);
      } catch (error) {
        log(error.toString());
        final failure = ErrorHandler.handle(error).failure;
        throw CustomException(failure.message);
      }
    } else {
      throw CustomException("Check your network connection");
    }
  }

  Future<Response> downloadProfileImage(String urlPath, String savePath) async {
    if (await _networkInfo.isConnected) {
      try {
        var dio = Dio();
        return await dio.download(urlPath, savePath);
      } catch (error) {
        final failure = ErrorHandler.handle(error).failure;
        throw CustomException(failure.message);
      }
    } else {
      throw CustomException("Check your network connection");
    }
  }

  Future<AuthResponse> register(RegisterRequest request) async {
    if (await _networkInfo.isConnected) {
      try {
        FormData formData = FormData.fromMap({
          ApiConstants.name: "${request.firstName} ${request.lastName}",
          ApiConstants.email: request.email,
          ApiConstants.password: request.password,
          ApiConstants.phone: request.phone,
          ApiConstants.profileImage: request.image,
        });
        var response = await _apiService.postData(
          endPoint: EndPoints.register,
          body: formData,
        );
        return AuthResponse.fromJson(response.data);
      } catch (error) {
        final failure = ErrorHandler.handle(error).failure;
        throw CustomException(failure.message);
      }
    } else {
      throw CustomException("Check your network connection");
    }
  }

  Future<bool> verfiyRegister(String email, String otp) async {
    if (await _networkInfo.isConnected) {
      try {
        var response = await _apiService.postData(
          endPoint: EndPoints.verifyRegister,
          body: {
            ApiConstants.email: email,
            ApiConstants.otp: otp,
          },
          token: appPrefs.getToken(),
        );
        log("response: ${response.data}");
        return response.data["status"] == 0 ? true : false;
      } catch (error) {
        log("eror: $error");
        final failure = ErrorHandler.handle(error).failure;
        throw CustomException(failure.message);
      }
    } else {
      throw CustomException("Check your network connection");
    }
  }

  Future<void> logout(String token) async {
    if (await _networkInfo.isConnected) {
      try {
        await _apiService.postData(
          endPoint: EndPoints.logout,
          body: {},
          token: token,
        );
      } catch (error) {
        final failure = ErrorHandler.handle(error).failure;
        throw CustomException(failure.message);
      }
    } else {
      throw CustomException("Check your network connection");
    }
  }

  Future<PasswordResetResponse> forgotPassword(String email) async {
    if (await _networkInfo.isConnected) {
      try {
        var response = await _apiService.postData(
          endPoint: EndPoints.forgotPassword,
          body: {
            "email": email,
          },
        );

        return PasswordResetResponse.fromJson(response.data);
      } catch (e) {
        throw CustomException(e.toString());
      }
    } else {
      throw CustomException("Check your network connection");
    }
  }

  Future<bool> resetPassword(ResetPasswordRequest request) async {
    if (await _networkInfo.isConnected) {
      try {
        var response = await _apiService.postData(
          endPoint: EndPoints.resetPassword,
          body: {
            "email": request.email,
            "password": request.password,
            "otp": request.otp,
          },
        );
        return response.data["success"] ?? false;
      } catch (e) {
        throw CustomException(e.toString());
      }
    } else {
      throw CustomException("Check your network connection");
    }
  }
}
