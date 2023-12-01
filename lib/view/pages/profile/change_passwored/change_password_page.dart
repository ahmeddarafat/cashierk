import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:start_app/resources/extensions/app_extensions.dart';
import 'package:start_app/view_model/profile/change_password/change_password_cubit.dart';

import '../../../../resources/localization/generated/l10n.dart';
import '../../../../resources/styles/app_colors.dart';
import '../../../widgets/global/public_button.dart';
import '../../../widgets/global/public_snack_bar.dart';
import '../../../widgets/global/public_text.dart';
import '../../../widgets/global/public_text_form_field.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({
    super.key,
  });

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  late final ChangePasswordCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = ChangePasswordCubit.getInstance(context);
    cubit.init();
  }

  @override
  void dispose() {
    cubit.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
      listener: (context, state) {
        if (state is ChangePasswordLoadingState) {
          cubit.changeSnipper();
        } else {
          if (cubit.spinner) {
            cubit.changeSnipper();
          }
          if (state is ChangePasswordErrorState) {
            MySnackBar.error(
                message: state.error, color: Colors.red, context: context);
          } else if (state is ChangePasswordSuccessState) {
            // TODO: "UI - build pop up success"
          }
        }
      },
      builder: (context, state) {
        if (state is! ChangePasswordSuccessState) {
          return ModalProgressHUD(
              inAsyncCall: cubit.spinner,
              child: Scaffold(
                appBar: AppBar(
                  centerTitle: true,
                  toolbarHeight: 80.h,
                  title: PublicText(
                    txt: S.of(context).changePassword,
                    fw: FontWeight.bold,
                    size: 22.sp,
                  ),
                  leading: IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios_new_outlined,
                      color: AppColors.orangePrimary,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                body: SingleChildScrollView(
                  child: Form(
                    key: cubit.formKey,
                    child: Padding(
                      padding: EdgeInsets.only(
                        right: 25.w,
                        left: 25.w,
                        bottom: 20.h,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// reset password subtitle
                          PublicText(
                            txt: S.of(context).changePasswordSubtitle,
                            color: AppColors.grey,
                            size: 18.sp,
                            align: TextAlign.center,
                          ),
                          40.ph,

                          /// old password
                          PublicText(
                            txt: S.of(context).oldPassword,
                            fw: FontWeight.w500,
                          ),
                          PublicTextFormField(
                            hint: S.of(context).passStars,
                            controller: cubit.oldPasswordController,
                            keyboardtype: TextInputType.visiblePassword,
                            isPassword: true,
                            showSuffixIcon: true,
                            validator: (password) {
                              if (password!.isEmpty) {
                                return S.of(context).enterYourPassword;
                              } else {
                                if (password.isPassValid()) {
                                  return null;
                                } else {
                                  return S.of(context).invalidPasswordMeg;
                                }
                              }
                            },
                          ),
                          20.ph,
                          /// old password
                          PublicText(
                            txt: S.of(context).newPassword,
                            fw: FontWeight.w500,
                          ),
                          PublicTextFormField(
                            hint: S.of(context).passStars,
                            controller: cubit.passwordController,
                            keyboardtype: TextInputType.visiblePassword,
                            isPassword: true,
                            showSuffixIcon: true,
                            validator: (password) {
                              if (password!.isEmpty) {
                                return S.of(context).enterYourPassword;
                              } else {
                                if (password.isPassValid()) {
                                  return null;
                                } else {
                                  return S.of(context).invalidPasswordMeg;
                                }
                              }
                            },
                          ),
                          20.ph,

                          /// confirm new password
                          PublicText(
                            txt: S.of(context).confirmNewPassword,
                            fw: FontWeight.w500,
                          ),
                          PublicTextFormField(
                            hint: S.of(context).confirmNewPassword,
                            controller: cubit.confirmPassController,
                            keyboardtype: TextInputType.visiblePassword,
                            isPassword: true,
                            showSuffixIcon: true,
                            validator: (confirmPassword) {
                              if (confirmPassword!.isEmpty) {
                                return S.of(context).enterYourPassword;
                              } else if (confirmPassword !=
                                  cubit.confirmPassController.text) {
                                return S.of(context).notMatchPassMeg;
                              } else {
                                return null;
                              }
                            },
                          ),
                          40.ph,

                          // button submit
                          PublicButton(
                            title: S.of(context).submit,
                            width: 350.w,
                            onPressed: () {
                              // To dismiss keyboard
                              FocusScope.of(context).unfocus();
                              cubit.chagePassword();
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ));
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
