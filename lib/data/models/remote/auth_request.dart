class RegisterRequest {
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String phone;

  RegisterRequest({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.phone,
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

