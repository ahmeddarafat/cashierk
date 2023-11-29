import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'reset_state.dart';

class ResetCubit extends Cubit<ResetState> {
  ResetCubit() : super(ResetInitial());

  static ResetCubit getInstance(BuildContext context) =>
      BlocProvider.of(context);

  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPassController;
  late GlobalKey<FormState> forgotFormKey;
  late GlobalKey<FormState> resetFormKey;
  String otp = '';
  bool _spinner = false;

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
      // try {
      //   final response = await _repo.forgotPassword(emailController.text);
      //   if (response.status == 1) {
      //     emit(ForgotPasswordSuccessState());
      //   }
      // } catch (e) {
      //   if (e is CustomException) {
      //     emit(AuthnErrorState(e.message));
      //   }
      // }
      // remove after connect app to api
      await Future.delayed(const Duration(seconds: 2));
      emit(ForgotPasswordSuccessState());
    }
  }

  Future<void> verifyEmail() async {
    if (otp.length == 4) {
      emit(VerifyEmailLoadingState());
      // try {
      //   final response = await _repo.verifyEmail(otp);
      //   if (response.status == 1) {
      //     emit(VerifyEmailSuccessState());
      //   }
      // } catch (e) {
      //   if (e is CustomException) {
      //     emit(AuthnErrorState("Wrong Code, Send Again"));
      //   }
      // }

      // remove after connect app to api
      await Future.delayed(const Duration(seconds: 2));
      emit(VerifyEmailSuccessState());
    } else {
      emit(const ResetErrorState("Enter 4-digits Code"));
    }
  }

  Future<void> resetPassword() async {
    if (resetFormKey.currentState!.validate()) {
      emit(ResetPasswordLoadingState());
      // try {
      // final request = ResetPasswordRequest(
      //   email: widget.email,
      //   password: newPasswordController.text,
      //   token: widget.otp,
      // );
      //   final respones = await _repo.resetPassword(request);
      //   if (respones.status == 1) {
      //     emit(ResetPasswordSuccessState());
      //   }
      // } catch (e) {
      //   if (e is CustomException) {
      //     emit(AuthnErrorState(e.message));
      //   }
      // }

      // remove after connect app to api
      await Future.delayed(const Duration(seconds: 2));
      emit(ResetPasswordSuccessState());
    }
  }
}
