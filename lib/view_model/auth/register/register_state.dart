part of 'register_cubit.dart';

sealed class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

final class RegisterInitial extends RegisterState {}

class RegisterLoadingState extends RegisterState {}

class RegisterSuccessState extends RegisterState {}

class ChangeAcceptTermsState extends RegisterState {
  final bool value;
  const ChangeAcceptTermsState(this.value);

  @override
  List<Object> get props => [value];
}
