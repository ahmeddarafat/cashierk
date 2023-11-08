import 'package:flutter_svg/svg.dart';
import 'package:start_app/resources/constants/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:start_app/resources/extensions/app_extensions.dart';
import 'package:start_app/view_model/auth/reset_pass/reset_cubit.dart';

import '../../../../resources/localization/generated/l10n.dart';
import '../../../../resources/router/app_router.dart';
import '../../../../resources/styles/app_colors.dart';
import '../../../widgets/global/public_button.dart';
import '../../../widgets/global/public_snack_bar.dart';
import '../../../widgets/global/public_text.dart';
import '../../../widgets/global/public_text_form_field.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({
    super.key,
  });

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  late final ResetCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = ResetCubit.getInstance(context);
    cubit.initReset();
  }

  @override
  void dispose() {
    cubit.disposeReset();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResetCubit, ResetState>(
      listenWhen: (_, current) {
        return (current is ResetPasswordState || current is ResetErrorState);
      },
      buildWhen: (_, current) {
        return (current is ResetPasswordState || current is ResetErrorState);
      },
      listener: (context, state) {
        if (state is ResetPasswordLoadingState) {
          cubit.changeSnipper();
        } else {
          if (cubit.spinner) {
            cubit.changeSnipper();
          }
          if (state is ResetErrorState) {
            MySnackBar.error(
                message: state.error, color: Colors.red, context: context);
          } else if (state is ResetPasswordSuccessState) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              AppRoutes.login,
              (_) => false,
            );
          }
        }
      },
      builder: (context, state) {
        if (state is! ResetPasswordSuccessState) {
          return ModalProgressHUD(
              inAsyncCall: cubit.spinner,
              child: Scaffold(
                appBar: AppBar(),
                body: SingleChildScrollView(
                  child: Form(
                    key: cubit.resetFormKey,
                    child: Padding(
                      padding: EdgeInsets.only(
                        right: 25.w,
                        left: 25.w,
                        bottom: 20.h,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          /// image
                          SvgPicture.asset(
                            Assets.imagesResetPass,
                            height: 250.h,
                            width: double.infinity,
                          ),
                          10.ph,

                          /// reset password title
                          PublicText(
                            txt: S.of(context).resetPasswordTitle,
                            fw: FontWeight.bold,
                            size: 20.sp,
                          ),
                          10.ph,

                          /// reset password subtitle
                          PublicText(
                            txt: S.of(context).resetPasswordSubtitle,
                            color: AppColors.grey,
                            size: 18.sp,
                            align: TextAlign.center,
                          ),
                          40.ph,

                          /// new password
                          Align(
                            alignment: Alignment.centerLeft,
                            child: PublicText(
                              txt: S.of(context).newPassword,
                              fw: FontWeight.w500,
                            ),
                          ),
                          PublicTextFormField(
                            hint: S.of(context).confirmNewPassword,
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

                          // confirm new password
                          Align(
                            alignment: Alignment.centerLeft,
                            child: PublicText(
                              txt: S.of(context).confirmNewPassword,
                              fw: FontWeight.w500,
                            ),
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

                          // button send
                          PublicButton(
                            title: S.of(context).submit,
                            width: 350.w,
                            onPressed: () {
                              // To dismiss keyboard
                              FocusScope.of(context).unfocus();
                              cubit.resetPassword();
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
