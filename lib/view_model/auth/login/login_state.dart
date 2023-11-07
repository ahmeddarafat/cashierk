part of 'login_cubit.dart';

@immutable
abstract class LoginState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginInitial extends LoginState {}

class LoadingState extends LoginState {}

class SuccessState extends LoginState {}

class ErrorState extends LoginState {
  final String error;
  ErrorState(this.error);

  @override
  List<Object?> get props => [error];
}

class ChangeRememberMeState extends LoginState {
  final bool value;
  ChangeRememberMeState(this.value);

  @override
  List<Object?> get props => [value];
}


// /// Forgot password
// abstract class ForgotPasswordState extends LoginState {}

// class ForgotPasswordLoadingState extends ForgotPasswordState {}

// class ForgotPasswordSuccessState extends ForgotPasswordState {}

// /// Verfiy Email
// abstract class VerifyEmailState extends LoginState {}

// class VerifyEmailLoadingState extends VerifyEmailState {}

// class VerifyEmailSuccessState extends VerifyEmailState {}

// /// reset Email
// abstract class ResetPasswordState extends LoginState {}

// class ResetPasswordLoadingState extends ResetPasswordState {}

// class ResetPasswordSuccessState extends ResetPasswordState {}
