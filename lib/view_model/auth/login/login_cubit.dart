import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';
import 'package:start_app/data/repository/auth_repository.dart';

import '../../../data/data_source/local/app_prefs.dart';
import '../../../data/models/remote/auth/auth_request.dart';
import '../../../data/models/remote/auth/auth_response.dart';
import '../../../data/network/custom_exception.dart';
import '../../../resources/service_locator/service_locator.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository repo;
  LoginCubit(this.repo) : super(LoginInitial());
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
      final request = LoginRequest(
        email: emailController.text,
        password: passwordController.text,
      );
      emit(LoginLoadingState());
      try {
        final response = await repo.login(request);
        _storeDataLocally(response);
        emit(LoginSuccessState());
      } catch (e) {
        log(e.toString());
        if (e is CustomException) {
          emit(LoginErrorState(e.message));
        }
      }
    }
  }

  void _storeDataLocally(AuthResponse response) {
    final user = response.user;
    appPrefs.setToken(response.token);
    rememberMe ? appPrefs.setUserLoggedIn() : null;
    appPrefs.setUserInfo(
      name: user.name,
      email: user.email,
      phone: user.phone,
    );
  }

  Future<void> logout() async {
    emit(LogoutLoadingState());
    try {
      await repo.logout(appPrefs.getToken());
      appPrefs.logout();
      emit(LogoutSuccessState());
    } catch (e) {
      if (e is CustomException) {
        emit(LogoutErrorState(e.message));
      }
    }
  }
}
