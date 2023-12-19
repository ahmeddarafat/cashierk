import 'package:start_app/data/data_source/remote/api_constants.dart';

class AuthResponse {
  final int? status;
  final String? message;
  final User user;
  final String token;

  AuthResponse({
    this.status,
    this.message,
    required this.user,
    required this.token,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> map) {
    return AuthResponse(
      status: map[ApiConstants.status] as int?,
      message: map[ApiConstants.message] as String?,
      user: User.fromJson(map[ApiConstants.user] as Map<String, dynamic>),
      token: map[ApiConstants.accessToken] as String,
    );
  }

  @override
  String toString() {
    return 'AuthResponse(status: $status, message: $message, user: $user, token: $token)';
  }
}

class User {
  final String name;
  final String email;
  final String phone;

  User({
    required this.name,
    required this.email,
    required this.phone,
  });

  factory User.fromJson(Map<String, dynamic> map) {
    return User(
      name: map[ApiConstants.name] as String,
      email: map[ApiConstants.email] as String,
      phone: map[ApiConstants.phone] as String,
    );
  }
}
