import 'package:dio/dio.dart';

class RegisterRequest {
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String phone;
  final MultipartFile image;

  RegisterRequest({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.phone,
    required this.image,
  });
}
class LoginRequest {
  final String email;
  final String password;

  LoginRequest({
    required this.email,
    required this.password,
  });
}

class ResetPasswordRequest {
  final String email;
  final String password;
  final String otp;

  ResetPasswordRequest({
    required this.email,
    required this.password,
    required this.otp,
  });
}

