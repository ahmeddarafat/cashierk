part of 'login_cubit.dart';

@immutable
abstract class LoginState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {}

class LoginErrorState extends LoginState {
  final String error;
  LoginErrorState(this.error);

  @override
  List<Object?> get props => [error];
}

class ChangeRememberMeState extends LoginState {
  final bool value;
  ChangeRememberMeState(this.value);

  @override
  List<Object?> get props => [value];
}

/// logout
class LogoutLoadingState extends LoginState {}

class LogoutSuccessState extends LoginState {}

class LogoutErrorState extends LoginState {
  final String error;
  LogoutErrorState(this.error);

  @override
  List<Object?> get props => [error];
}


