import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';

import '../../../data/data_source/local/app_prefs.dart';
import '../../../resources/service_locator/service_locator.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  static LoginCubit getInstance(BuildContext context) =>
      BlocProvider.of(context);

  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final GlobalKey<FormState> formKey;

  bool _spinner = false;
  bool rememberMe = false;
  bool acceptTerms = false;
  final appPrefs = getIt<AppPrefs>();

  /// init & dispose
  void init() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    formKey = GlobalKey<FormState>();
  }

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }

  /// Sinpper
  bool get spinner {
    return _spinner;
  }

  void changeSnipper() {
    _spinner = !_spinner;
  }

  /// checkboxes

  void changeRememberMe() {
    rememberMe = !rememberMe;
    emit(ChangeRememberMeState(rememberMe));
  }

  /// Login
  Future<void> login() async {
    if (formKey.currentState!.validate()) {
      // final request = LoginRequest(
      //   email: emailController.text,
      //   password: passwordController.text,
      // );
      emit(LoginLoadingState());
      // try {
      //   // final response = await _repo.login(request);
      //   // if (response.status == 1) {
      //   //   appPrefs.setToken(response.data!.token);
      //   //   appPrefs.setUserLoggedIn(rememberMe);
      //   //   final user = response.data!.user;
      //   //   appPrefs.setUserInfo(
      //   //     firstName: user.firstName,
      //   //     lastName: user.lastName,
      //   //     email: user.email,
      //   //     phone: user.phoneNumber,
      //   //   );
      //   //   emit(LoginSuccessState());
      //   // } else {
      //   //   emit(AuthnErrorState("Email or Passowrd is worng"));
      //   // }
      // } catch (e) {
      //   if (e is CustomException) {
      //     emit(ErrorState(e.message));
      //   }
      // }

      // remove after connect app to api
      await Future.delayed(const Duration(seconds: 2));
      emit(LoginSuccessState());
    }
  }

  // Future<void> logout() async {
  //   if (appPrefs.getToken() != null) {
  //     await _repo.logout(appPrefs.getToken()!);
  //   }
  //   appPrefs.logout();
  //   appPrefs.removeToken();
  //   appPrefs.removeUserInfo();
  // }
}
