import 'package:start_app/data/data_source/remote/api_variables.dart';

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
      status: map[ApiVars.status] as int?,
      message: map[ApiVars.message] as String?,
      user: User.fromJson(map[ApiVars.user] as Map<String, dynamic>),
      token: map[ApiVars.token] as String,
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
      name: map[ApiVars.name] as String,
      email: map[ApiVars.email] as String,
      phone: map[ApiVars.phone] as String,
    );
  }
}
