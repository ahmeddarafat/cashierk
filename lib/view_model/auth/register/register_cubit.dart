import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../data/data_source/local/app_prefs.dart';
import '../../../data/models/auth_request.dart';
import '../../../data/models/auth_response.dart';
import '../../../data/network/custom_exception.dart';
import '../../../data/repository/auth_repository.dart';
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
  final appPrefs = getIt<AppPrefs>();

  String otp = '';
  String? image;
  bool _spinner = false;
  bool acceptTerms = false;

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
      if (image == null) {
        emit(RegisterErrorState(S.current.profileImageErrorMessage));
        return;
      }
      if (!acceptTerms) {
        emit(RegisterErrorState(S.current.acceptTermsErrorMessage));
        return;
      }
      final request = RegisterRequest(
        firstName: firsttNameController.text,
        lastName: lastNameController.text,
        email: emailController.text,
        password: passwordConfirmController.text,
        phone: phoneController.text,
        image: await _getImageFile(),
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
    }
  }

  /// profile image
  Future<void> pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final image = await picker.pickImage(source: source);
    if (image == null) return;
    this.image = image.path;
    appPrefs.setProfileImage(image.path);
    emit(ChangeProfileImageState(image.name));
  }

  /// verify email
  Future<void> verifyEmail() async {
    log("otp: $otp");
    log("otp.length: ${otp.length}");
    emit(VerifyEmailLoadingState());
    if (otp.length == 6) {
      try {
        final response = await repo.verfiyRegister(emailController.text, otp);
        log("response: $response");
        if (response) {
          emit(VerifyEmailSuccessState());
          appPrefs.setUserLoggedIn();
        } else {
          log("invalid code:");
          emit(const VerifyEmailErrorState("Invalid Code"));
        }
      } catch (error) {
        if (error is CustomException) {
          log("message: ${error.message}");
          emit(VerifyEmailErrorState(error.message));
        }
      }
    } else {
      emit(const VerifyEmailErrorState("Enter 6-digits Code"));
    }
  }

  void setOtp(String otp) {
    this.otp = otp;
  }

  void _storeDataLocally(AuthResponse response) {
    appPrefs.setToken(response.token);
    final user = response.user;
    appPrefs.setUserInfo(
      name: user.name,
      email: user.email,
      phone: user.phone?? "",
    );
  }

  Future<MultipartFile> _getImageFile() {
    File file = File(image!);
    String fileName = file.path.split('/').last;
    return MultipartFile.fromFile(file.path, filename: fileName);
  }
}
