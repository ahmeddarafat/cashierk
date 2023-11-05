import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';

import '../../data/data_source/local/app_prefs.dart';
import '../../data/error_handler/custom_exception.dart';
import '../../resources/service_locator/service_locator.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  static AuthCubit getInstance(BuildContext context) =>
      BlocProvider.of(context);

  late final TextEditingController loginEmailController;
  late final TextEditingController loginPasswordController;
  bool _spinner = false;
  bool rememberMe = false;
  bool acceptTerms = false;
  final appPrefs = getIt<AppPrefs>();
  late final GlobalKey<FormState> loginformKey;

  /// init & dispose
  void init() {
    loginEmailController = TextEditingController();
    loginPasswordController = TextEditingController();
    loginformKey = GlobalKey<FormState>();
  }

  void dispose() {
    loginEmailController.dispose();
    loginPasswordController.dispose();
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

  void changeAcceptTerms() {
    acceptTerms = !acceptTerms;
    emit(ChangeAcceptTermsState(acceptTerms));
  }

  /// Login
  Future<void> login() async {
    if (loginformKey.currentState!.validate()) {
      // final request = LoginRequest(
      //   email: emailController.text,
      //   password: passwordController.text,
      // );
      emit(LoginLoadingState());
      try {
        // final response = await _repo.login(request);
        // if (response.status == 1) {
        //   appPrefs.setToken(response.data!.token);
        //   appPrefs.setUserLoggedIn(rememberMe);
        //   final user = response.data!.user;
        //   appPrefs.setUserInfo(
        //     firstName: user.firstName,
        //     lastName: user.lastName,
        //     email: user.email,
        //     phone: user.phoneNumber,
        //   );
        //   emit(LoginSuccessState());
        // } else {
        //   emit(AuthnErrorState("Email or Passowrd is worng"));
        // }
      } catch (e) {
        if (e is CustomException) {
          emit(AuthnErrorState(e.message));
        }
      }
    }
  }

  // Future<void> register(RegisterRequest request) async {
  //   if (acceptTerms) {
  //     emit(RegisterLoadingState());
  //     try {
  //       final response = await _repo.register(request);
  //       if (response.status == 1) {
  //         appPrefs.setUserLoggedIn(true);
  //         appPrefs.setToken(response.data!.token);
  //         final user = response.data!.user;
  //         appPrefs.setUserInfo(
  //           firstName: user.firstName,
  //           lastName: user.lastName,
  //           email: user.email,
  //           phone: user.phoneNumber,
  //         );
  //         emit(RegisterSuccessState());
  //       } else {
  //         emit(AuthnErrorState(response.message));
  //       }
  //     } catch (e) {
  //       if (e is CustomException) {
  //         emit(AuthnErrorState(e.message));
  //       }
  //     }
  //   } else {
  //     emit(AuthnErrorState(S.current.acceptTermsErrorMessage));
  //   }
  // }

  // Future<void> forgotPassword(String email) async {
  //   emit(ForgotPasswordLoadingState());
  //   try {
  //     final response = await _repo.forgotPassword(email);
  //     if (response.status == 1) {
  //       emit(ForgotPasswordSuccessState());
  //     }
  //   } catch (e) {
  //     if (e is CustomException) {
  //       emit(AuthnErrorState(e.message));
  //     }
  //   }
  // }

  // String otp = '';
  // Future<void> verifyEmail() async {
  //   if (otp.length == 6) {
  //     emit(VerifyEmailLoadingState());
  //     try {
  //       final response = await _repo.verifyEmail(otp);
  //       if (response.status == 1) {
  //         emit(VerifyEmailSuccessState());
  //       }
  //     } catch (e) {
  //       if (e is CustomException) {
  //         emit(AuthnErrorState("Wrong Code, Send Again"));
  //       }
  //     }
  //   } else {
  //     emit(AuthnErrorState("Enter 6-digits Code"));
  //   }
  // }

  // Future<void> resetPassword(ResetPasswordRequest request) async {
  //   emit(ResetPasswordLoadingState());
  //   try {
  //     final respones = await _repo.resetPassword(request);
  //     if (respones.status == 1) {
  //       emit(ResetPasswordSuccessState());
  //     }
  //   } catch (e) {
  //     if (e is CustomException) {
  //       emit(AuthnErrorState(e.message));
  //     }
  //   }
  // }

  // Future<void> logout() async {
  //   if (appPrefs.getToken() != null) {
  //     await _repo.logout(appPrefs.getToken()!);
  //   }
  //   appPrefs.logout();
  //   appPrefs.removeToken();
  //   appPrefs.removeUserInfo();
  // }
}
