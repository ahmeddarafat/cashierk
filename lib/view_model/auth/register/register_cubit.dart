import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../resources/localization/generated/l10n.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  static RegisterCubit getInstance(BuildContext context) =>
      BlocProvider.of(context);

  bool acceptTerms = false;
  late final TextEditingController firsttNameController;
  late final TextEditingController lastNameController;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final TextEditingController passwordConfirmController;
  late final TextEditingController phoneController;
  late final GlobalKey<FormState> formKey;
  bool _spinner = false;

  /// init & dispose
  void init() {
    firsttNameController = TextEditingController();
    lastNameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    passwordConfirmController = TextEditingController();
    phoneController = TextEditingController();
    formKey = GlobalKey<FormState>();
  }

  void dispose() {
    firsttNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    passwordConfirmController.dispose();
    phoneController.dispose();
  }

  /// Sinpper
  bool get spinner {
    return _spinner;
  }

  void changeSnipper() {
    _spinner = !_spinner;
  }

  /// terms
  void changeAcceptTerms() {
    acceptTerms = !acceptTerms;
    emit(ChangeAcceptTermsState(acceptTerms));
  }

  /// register
  Future<void> register() async {
    if (formKey.currentState!.validate()) {
      if (acceptTerms) {
        emit(RegisterLoadingState());
        // try {
        //   final response = await _repo.register(request);
        //   if (response.status == 1) {
        //     appPrefs.setUserLoggedIn(true);
        //     appPrefs.setToken(response.data!.token);
        //     final user = response.data!.user;
        //     appPrefs.setUserInfo(
        //       firstName: user.firstName,
        //       lastName: user.lastName,
        //       email: user.email,
        //       phone: user.phoneNumber,
        //     );
        //     emit(RegisterSuccessState());
        //   } else {
        //     emit(AuthnErrorState(response.message));
        //   }
        // } catch (e) {
        //   if (e is CustomException) {
        //     emit(AuthnErrorState(e.message));
        //   }
        // }

        // remove after connect app to api
        await Future.delayed(const Duration(seconds: 2));
        emit(RegisterSuccessState());
      } else {
        emit(RegisterErrorState(S.current.acceptTermsErrorMessage));
      }
    }
  }
}
