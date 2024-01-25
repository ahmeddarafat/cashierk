import 'package:start_app/data/data_source/remote/api_constants.dart';
import 'package:start_app/data/network/error_handler.dart';

import '../data_source/remote/api_service.dart';
import '../models/auth/auth_request.dart';
import '../models/auth/auth_response.dart';
import '../network/custom_exception.dart';
import '../network/network_info.dart';

class AuthRepository {
  final NetworkInfo _networkInfo;
  late final ApiService _apiService;

  AuthRepository({
    required NetworkInfo networkInfo,
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
        var response = await _apiService.postData(
          endPoint: EndPoints.register,
          body: {
            ApiConstants.name: "${request.firstName} ${request.lastName}",
            ApiConstants.email: request.email,
            ApiConstants.password: request.password,
            ApiConstants.phone: request.phone,
          },
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

  // Future<AuthResponse> forgotPassword(String email) async {
  //   if (await _networkInfo.isConnected) {
  //     try {
  //       var response = await _apiService.postData(
  //         endPoint: EndPoints.forgetPassword,
  //         body: {
  //           "email": email,
  //         },
  //       );
  //       return AuthResponse.fromJson(response.data);
  //     } catch (e) {
  //       throw CustomException(e.toString());
  //     }
  //   } else {
  //     throw CustomException("Check your network connection");
  //   }
  // }

  // Future<AuthResponse> verifyEmail(String otp) async {
  //   if (await _networkInfo.isConnected) {
  //     try {
  //       var response = await _apiService.postData(
  //         endPoint: EndPoints.checkOtp,
  //         body: {
  //           "token": otp,
  //         },
  //       );
  //       return AuthResponse.fromJson(response.data);
  //     } catch (e) {
  //       throw CustomException("repo error $e");
  //     }
  //   } else {
  //     throw CustomException("Check your network connection");
  //   }
  // }

  // Future<AuthResponse> resetPassword(ResetPasswordRequest request) async {
  //   if (await _networkInfo.isConnected) {
  //     try {
  //       var response = await _apiService.postData(
  //         endPoint: EndPoints.updatePassword,
  //         body: {
  //           "email": request.email,
  //           "password": request.password,
  //           "password_confirmation": request.password,
  //           "token": request.token,
  //         },
  //       );
  //       return AuthResponse.fromJson(response.data);
  //     } catch (e) {
  //       throw CustomException(e.toString());
  //     }
  //   } else {
  //     throw CustomException("Check your network connection");
  //   }
  // }
}
