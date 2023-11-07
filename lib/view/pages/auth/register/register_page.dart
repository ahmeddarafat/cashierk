import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:start_app/resources/extensions/app_extensions.dart';
import 'package:start_app/view/widgets/local/custom_divider.dart';

import '../../../../resources/localization/generated/l10n.dart';
import '../../../../resources/styles/app_colors.dart';
import '../../../../view_model/auth/register/register_cubit.dart';
import '../../../widgets/global/public_button.dart';
import '../../../widgets/global/public_snack_bar.dart';
import '../../../widgets/global/public_text.dart';
import '../../../widgets/global/public_text_form_field.dart';
import '../../../widgets/local/custom_social_auth.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late final RegisterCubit cubit;
  @override
  void initState() {
    super.initState();
    cubit = RegisterCubit.getInstance(context);
    cubit.init();
  }

  @override
  void dispose() {
    cubit.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterLoadingState) {
          cubit.changeSnipper();
        } else {
          if (cubit.spinner) {
            cubit.changeSnipper();
          }
          if (state is RegisterErrorState) {
            MySnackBar.error(
                message: state.error, color: Colors.red, context: context);
          } else if (state is RegisterSuccessState) {
            // TODO: "UI: connect register "
            // Navigator.pushNamedAndRemoveUntil(
            //   context,
            //   AppRoutes.layouts,
            //   (_) => false,
            // );
          }
        }
      },
      builder: (context, state) {
        if (state is! RegisterSuccessState) {
          return ModalProgressHUD(
            inAsyncCall: cubit.spinner,
            child: Scaffold(
              backgroundColor: AppColors.white,
              appBar: AppBar(),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Form(
                    key: cubit.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        20.ph,

                        /// Register Title
                        Align(
                          alignment: Alignment.centerLeft,
                          child: PublicText(
                            txt: S.of(context).registerTitle,
                            size: 20.sp,
                            fw: FontWeight.w600,
                            letterSpacing: 2.8.h,
                          ),
                        ),
                        30.ph,

                        //username
                        Align(
                          alignment: Alignment.centerLeft,
                          child: PublicText(
                            txt: S.of(context).username,
                            color: AppColors.black,
                            fw: FontWeight.w500,
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: PublicTextFormField(
                                hint: S.of(context).firstName,
                                controller: cubit.firsttNameController,
                                keyboardtype: TextInputType.name,
                                validator: (name) {
                                  if (name == null || name.length < 3) {
                                    return S.of(context).enterFirstName;
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ),
                            10.pw,
                            Expanded(
                              child: PublicTextFormField(
                                hint: S.of(context).lastName,
                                controller: cubit.lastNameController,
                                keyboardtype: TextInputType.name,
                                validator: (name) {
                                  if (name == null || name.length < 3) {
                                    return S.of(context).enterLastName;
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                        15.ph,

                        /// Email
                        Align(
                          alignment: Alignment.centerLeft,
                          child: PublicText(
                            txt: S.of(context).email,
                            color: AppColors.black,
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
                        15.ph,

                        /// password
                        Align(
                          alignment: Alignment.centerLeft,
                          child: PublicText(
                            txt: S.of(context).password,
                            color: AppColors.black,
                            fw: FontWeight.w500,
                          ),
                        ),
                        PublicTextFormField(
                          hint: S.of(context).passwordHint,
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
                        15.ph,

                        /// confirm password
                        Align(
                          alignment: Alignment.centerLeft,
                          child: PublicText(
                            txt: S.of(context).confirmPass,
                            color: AppColors.black,
                            fw: FontWeight.w500,
                          ),
                        ),
                        PublicTextFormField(
                          hint: S.of(context).confirmPassHint,
                          controller: cubit.passwordConfirmController,
                          keyboardtype: TextInputType.visiblePassword,
                          isPassword: true,
                          showSuffixIcon: true,
                          validator: (pass) {
                            if (pass!.isEmpty) {
                              return S.of(context).enterYourPassword;
                            } else if (pass != cubit.passwordController.text) {
                              return S.of(context).notMatchPassMeg;
                            } else {
                              return null;
                            }
                          },
                        ),
                        15.ph,

                        /// phone
                        Align(
                          alignment: Alignment.centerLeft,
                          child: PublicText(
                            txt: S.of(context).phone,
                            color: AppColors.black,
                            fw: FontWeight.w500,
                          ),
                        ),
                        PublicTextFormField(
                          hint: S.of(context).phone,
                          controller: cubit.phoneController,
                          keyboardtype: TextInputType.number,
                          validator: (phone) {
                            if (phone!.isEmpty) {
                              return S.of(context).phoneHint;
                            } else if (phone.isMobileNumberValid()) {
                              return null;
                            } else {
                              return S.of(context).invalidPhone;
                            }
                          },
                        ),

                        // accept terms
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            BlocBuilder<RegisterCubit, RegisterState>(
                              buildWhen: (_, current) =>
                                  current is ChangeAcceptTermsState,
                              builder: (context, state) {
                                return Checkbox(
                                  value: cubit.acceptTerms,
                                  activeColor: AppColors.orangePrimary,
                                  onChanged: (_) => cubit.changeAcceptTerms(),
                                );
                              },
                            ),
                            InkWell(
                              onTap: () {
                                // TODO: "UI: screen to read terms"
                                // Navigator.pushNamed(
                                //     context, AppRoutes.privacyPolicy);
                              },
                              child: PublicText(
                                txt: S.of(context).privacyPolicy,
                                align: TextAlign.center,
                                fw: FontWeight.w500,
                                size: 14.sp,
                                color: AppColors.orangePrimary,
                                under: true,
                              ),
                            )
                          ],
                        ),
                        20.ph,

                        /// register button
                        PublicButton(
                          title: S.of(context).register,
                          width: 350.w,
                          onPressed: () {
                            // To dismiss keyboard
                            FocusScope.of(context).unfocus();
                            cubit.register();
                          },
                        ),
                        15.ph,
                        const CustomDivider(),
                        15.ph,

                        /// register with facebook or gmail
                        const CustomSocialAuth(),
                        10.ph,

                        /// Already have account
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            PublicText(
                              txt: S.of(context).alreadyHaveAccount,
                              size: 13.sp,
                              fw: FontWeight.bold,
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: PublicText(
                                txt: S.of(context).login,
                                fw: FontWeight.bold,
                                size: 13.sp,
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
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
