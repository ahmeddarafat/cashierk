import 'dart:developer';
import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../data/data_source/local/app_prefs.dart';
import '../../../resources/service_locator/service_locator.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late GlobalKey<FormState> formKey;
  File? image;
  late final AppPrefs appPrefs;

  ProfileCubit() : super(ProfileInitState()) {
    appPrefs = getIt<AppPrefs>();
    _initProfileImage();
  }

  static ProfileCubit getInstance(BuildContext context) =>
      BlocProvider.of(context);

  void init() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    formKey = GlobalKey();
  }

  void dispose() {
    nameController.dispose();
    emailController.dispose();
  }

  void getUserInfo() {
    final userInfo = appPrefs.getUserInfo();
    emit(
      ChangeProfileState(
        name: userInfo.name,
        email: userInfo.email,
      ),
    );
  }

  void editUserInfo() {
    if (formKey.currentState!.validate()) {
      log("is valid");
      appPrefs.setUserInfo(
        name: nameController.text,
        email: emailController.text,
        phone: "unknown",
      );

      emit(
        ChangeProfileState(
          name: nameController.text,
          email: emailController.text,
        ),
      );
    }
  }

  Future<void> pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final image = await picker.pickImage(source: source);
    if (image == null) return;
    this.image = File(image.path);
    appPrefs.setProfileImage(image.path);
    emit(ChangeProfileImageState(image.name));
  }

  void _initProfileImage() {
    var imagePath = appPrefs.getProfileImage();
    if (imagePath != null) {
      image = File(imagePath);
    }
  }
}
