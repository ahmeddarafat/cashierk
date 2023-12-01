import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  late TextEditingController oldPasswordController;
  late TextEditingController passwordController;
  late TextEditingController confirmPassController;
  late GlobalKey<FormState> formKey;
  bool _spinner = false;

  ChangePasswordCubit() : super(ChangePasswordInitial());

  static ChangePasswordCubit getInstance(BuildContext context) =>
      BlocProvider.of(context);

  /// init & dispose
  void init() {
    oldPasswordController = TextEditingController();
    passwordController = TextEditingController();
    confirmPassController = TextEditingController();
  }

  void dispose() {
    oldPasswordController.dispose();
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

  Future<void> chagePassword() async {
    if (formKey.currentState!.validate()) {
      emit(ChangePasswordLoadingState());
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
      emit(ChangePasswordSuccessState());
    }
  }
}
