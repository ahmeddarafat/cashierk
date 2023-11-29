part of 'reset_cubit.dart';

abstract class ResetState extends Equatable {
  const ResetState();

  @override
  List<Object?> get props => [];
}

class ResetInitial extends ResetState {}

class ResetErrorState extends ResetState {
  final String error;
  const ResetErrorState(this.error);

  @override
  List<Object?> get props => [error];
}

/// Forgot password
abstract class ForgotPasswordState extends ResetState {}

class ForgotPasswordLoadingState extends ForgotPasswordState {}

class ForgotPasswordSuccessState extends ForgotPasswordState {}

/// Verfiy Email
abstract class VerifyEmailState extends ResetState {}

class VerifyEmailLoadingState extends VerifyEmailState {}

class VerifyEmailSuccessState extends VerifyEmailState {}

/// reset Email
abstract class ResetPasswordState extends ResetState {}

class ResetPasswordLoadingState extends ResetPasswordState {}

class ResetPasswordSuccessState extends ResetPasswordState {}
