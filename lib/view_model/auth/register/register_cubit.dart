import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:start_app/data/data_source/local/app_prefs.dart';
import 'package:start_app/data/models/remote/auth_request.dart';
import 'package:start_app/data/models/remote/auth_response.dart';
import 'package:start_app/data/repository/auth_repository.dart';

import '../../../data/network/custom_exception.dart';
import '../../../resources/localization/generated/l10n.dart';
import '../../../resources/service_locator/service_locator.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final AuthRepository repo;
  RegisterCubit(this.repo) : super(RegisterInitial());

  static RegisterCubit getInstance(BuildContext context) =>
      BlocProvider.of(context);

  late final TextEditingController firsttNameController;
  late final TextEditingController lastNameController;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final TextEditingController passwordConfirmController;
  late final TextEditingController phoneController;
  late final GlobalKey<FormState> formKey;
  bool _spinner = false;
  bool acceptTerms = false;
  final appPrefs = getIt<AppPrefs>();

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
        final request = RegisterRequest(
          firstName: firsttNameController.text,
          lastName: lastNameController.text,
          email: emailController.text,
          password: passwordConfirmController.text,
          phone: phoneController.text,
        );
        emit(RegisterLoadingState());
        try {
          final response = await repo.register(request);
          _storeDataLocally(response);
          emit(RegisterSuccessState());
        } catch (e) {
          if (e is CustomException) {
            emit(RegisterErrorState(e.message));
          }
        }
      } else {
        emit(RegisterErrorState(S.current.acceptTermsErrorMessage));
      }
    }
  }

  void _storeDataLocally(AuthResponse response) {
    appPrefs.setUserLoggedIn();
    appPrefs.setToken(response.token);
    final user = response.user;
    appPrefs.setUserInfo(
      name: user.name,
      email: user.email,
      phone: user.phone,
    );
  }
}
