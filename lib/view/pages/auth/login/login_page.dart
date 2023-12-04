import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../resources/extensions/app_extensions.dart';
import '../../../../resources/localization/generated/l10n.dart';
import '../../../../resources/router/app_router.dart';
import '../../../../resources/styles/app_colors.dart';
import '../../../../view_model/auth/login/login_cubit.dart';
import '../../../widgets/public_button.dart';
import '../../../widgets/public_snack_bar.dart';
import '../../../widgets/public_text.dart';
import '../../../widgets/public_text_form_field.dart';
import '../../../widgets/custom_divider.dart';
import '../../../widgets/custom_social_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final LoginCubit cubit;

  @override
  void initState() {
    super.initState();

    cubit = LoginCubit.getInstance(context);
    cubit.init();
  }

  @override
  void dispose() {
    cubit.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoadingState) {
          cubit.changeSnipper();
        } else {
          if (cubit.spinner) {
            cubit.changeSnipper();
          }
          if (state is LoginErrorState) {
            MySnackBar.error(
                message: state.error, color: AppColors.red, context: context);
          } else if (state is LoginSuccessState) {
            Navigator.pushReplacementNamed(context, AppRoutes.layouts);
          }
        }
      },
      builder: (context, state) {
        if (state is! LoginSuccessState) {
          return ModalProgressHUD(
            inAsyncCall: cubit.spinner,
            child: SafeArea(
              child: Scaffold(
                backgroundColor: AppColors.white,
                body: Center(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Form(
                        key: cubit.formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            40.ph,

                            /// Login to your account
                            Align(
                              alignment: Alignment.centerLeft,
                              child: PublicText(
                                txt: S.of(context).loginTitle,
                                size: 20.sp,
                                fw: FontWeight.w600,
                                letterSpacing: 2.8.h,
                              ),
                            ),
                            40.ph,

                            /// email
                            Align(
                              alignment: Alignment.centerLeft,
                              child: PublicText(
                                txt: S.of(context).email,
                                fw: FontWeight.w500,
                              ),
                            ),
                            PublicTextFormField(
                              hint: S.of(context).emailHint,
                              keyboardtype: TextInputType.emailAddress,
                              controller: cubit.emailController,
                              validator: (email) {
                                if (email!.isEmpty) {
                                  return S.of(context).enterYourEmail;
                                } else if (email.isEmailValid()) {
                                  return null;
                                } else {
                                  return S.of(context).invalidEmailMeg;
                                }
                              },
                            ),
                            20.ph,

                            //password
                            Align(
                              alignment: Alignment.centerLeft,
                              child: PublicText(
                                txt: S.of(context).password,
                                color: AppColors.black,
                              ),
                            ),
                            PublicTextFormField(
                              hint: S.of(context).passwordHint,
                              controller: cubit.passwordController,
                              keyboardtype: TextInputType.visiblePassword,
                              isPassword: true,
                              showSuffixIcon: true,
                              validator: (password) {
                                if (password == null || password.isEmpty) {
                                  return S.of(context).enterYourPassword;
                                } else if (password.isPassValid()) {
                                  return null;
                                } else {
                                  return S.of(context).invalidPasswordMeg;
                                }
                              },
                            ),

                            /// Remember me & forget password
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    BlocBuilder<LoginCubit, LoginState>(
                                      buildWhen: (_, current) =>
                                          current is ChangeRememberMeState,
                                      builder: (context, state) {
                                        return Checkbox(
                                          value: cubit.rememberMe,
                                          activeColor: AppColors.orangePrimary,
                                          onChanged: (_) =>
                                              cubit.changeRememberMe(),
                                        );
                                      },
                                    ),
                                    PublicText(
                                      txt: S.of(context).rememberMe,
                                      size: 15.sp,
                                      fw: FontWeight.w500,
                                    ),
                                  ],
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                      context,
                                      AppRoutes.forgotPassword,
                                    );
                                  },
                                  child: PublicText(
                                    txt: S.of(context).forgetPassword,
                                    size: 14.sp,
                                    color: AppColors.orangePrimary,
                                  ),
                                ),
                              ],
                            ),
                            40.ph,

                            /// button login
                            PublicButton(
                              title: S.of(context).login,
                              onPressed: () {
                                // To dismiss keyboard
                                FocusScope.of(context).unfocus();
                                cubit.login();
                              },
                            ),
                            40.ph,
                            const CustomDivider(),
                            38.ph,

                            /// login with facebook or gmail
                            const CustomSocialAuth(),
                            10.ph,

                            /// don't have account signup
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                PublicText(
                                  txt: S.of(context).dontHaveAccount,
                                  size: 15.sp,
                                  fw: FontWeight.bold,
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, AppRoutes.register);
                                  },
                                  child: PublicText(
                                    txt: S.of(context).register,
                                    fw: FontWeight.bold,
                                    size: 15.sp,
                                    color: AppColors.orangePrimary,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}

