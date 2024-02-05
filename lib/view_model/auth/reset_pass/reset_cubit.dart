import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/auth_request.dart';
import '../../../data/network/custom_exception.dart';
import '../../../data/repository/auth_repository.dart';

part 'reset_state.dart';

class ResetCubit extends Cubit<ResetState> {
  final AuthRepository repo;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPassController;
  late GlobalKey<FormState> forgotFormKey;
  late GlobalKey<FormState> resetFormKey;
  String otp = '';
  bool _spinner = false;

  ResetCubit(this.repo) : super(ResetInitial());

  static ResetCubit getInstance(BuildContext context) =>
      BlocProvider.of(context);

  /// init & dispose
  void initForgot() {
    emailController = TextEditingController();
    forgotFormKey = GlobalKey<FormState>();
  }

  void initReset() {
    passwordController = TextEditingController();
    confirmPassController = TextEditingController();
    resetFormKey = GlobalKey<FormState>();
  }

  void disposeForgot() {
    emailController.dispose();
  }

  void disposeReset() {
    passwordController.dispose();
    confirmPassController.dispose();
  }

  /// Sinpper
  bool get spinner {
    return _spinner;
  }

  void changeSnipper() {
    _spinner = !_spinner;
  }

  /// Forgot Pass
  Future<void> forgotPassword() async {
    if (forgotFormKey.currentState!.validate()) {
      emit(ForgotPasswordLoadingState());
      try {
        final response = await repo.forgotPassword(emailController.text);
        if (response.status ?? false) {
          otp = response.otp ?? '';
          emit(ForgotPasswordSuccessState());
        }
      } catch (e) {
        if (e is CustomException) {
          emit(ResetErrorState(e.message));
        }
      }
    }
  }

  Future<void> verifyEmail(String otp) async {
    if (this.otp == otp) {
      emit(VerifyEmailSuccessState());
    } else {
      emit(const ResetErrorState("Enter 6-digits Code"));
    }
  }

  Future<void> resetPassword() async {
    if (resetFormKey.currentState!.validate()) {
      emit(ResetPasswordLoadingState());
      try {
        final request = ResetPasswordRequest(
          email: emailController.text,
          password: passwordController.text,
          otp: otp,
        );
        final response = await repo.resetPassword(request);
        if (response) {
          emit(ResetPasswordSuccessState());
        }
      } catch (e) {
        if (e is CustomException) {
          emit(ResetErrorState(e.message));
        }
      }
    }
  }
}
