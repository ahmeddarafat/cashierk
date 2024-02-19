import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../../../resources/constants/app_assets.dart';
import '../../../../resources/extensions/app_extensions.dart';

import '../../../../resources/localization/generated/l10n.dart';
import '../../../../resources/router/app_router.dart';
import '../../../../resources/styles/app_colors.dart';
import '../../../../view_model/auth/reset_pass/reset_cubit.dart';
import '../../../widgets/public_button.dart';
import '../../../widgets/public_snack_bar.dart';
import '../../../widgets/public_text.dart';
import '../../../widgets/public_text_form_field.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  late final ResetCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = ResetCubit.getInstance(context);
    cubit.initForgot();
  }

  @override
  void dispose() {
    cubit.disposeForgot();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResetCubit, ResetState>(
      listenWhen: (_, current) {
        return (current is ForgotPasswordState || current is ResetErrorState);
      },
      buildWhen: (_, current) {
        return (current is ForgotPasswordState || current is ResetErrorState);
      },
      listener: (context, state) {
        if (state is ForgotPasswordLoadingState) {
          cubit.changeSnipper();
        } else {
          if (cubit.spinner) {
            cubit.changeSnipper();
          }
          if (state is ResetErrorState) {
            MySnackBar.error(
                message: state.error, color: Colors.red, context: context);
          } else if (state is ForgotPasswordSuccessState) {
            Navigator.pushNamed(
              context,
              AppRoutes.emailVerify,
            );
          }
        }
      },
      builder: (context, state) {
        if (state is! ForgotPasswordSuccessState) {
          return ModalProgressHUD(
            inAsyncCall: cubit.spinner,
            child: Scaffold(
              appBar: AppBar(),
              body: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(
                    right: 25.w,
                    left: 25.w,
                    bottom: 20.h,
                  ),
                  child: Form(
                    key: cubit.forgotFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        /// image
                        SvgPicture.asset(
                          Assets.imagesForgetPass,
                          height: 250.h,
                          width: double.infinity,
                        ),
                        10.ph,

                        /// forget password title
                        PublicText(
                          txt: S.of(context).forgetPasswordTitle,
                          fw: FontWeight.bold,
                          size: 20.sp,
                          align: TextAlign.center,
                        ),
                        10.ph,

                        /// forget password sub title
                        PublicText(
                          txt: S.of(context).forgetPasswordSubtitle,
                          size: 16.sp,
                          color: AppColors.grey,
                          align: TextAlign.center,
                        ),
                        40.ph,

                        /// email
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
                          controller: cubit.emailController,
                          validator: (email) {
                            if (email!.isEmpty) {
                              return S.of(context).enterYourEmail;
                            } else {
                              if (email.isEmailValid()) {
                                return null;
                              } else {
                                return S.of(context).invalidEmailMeg;
                              }
                            }
                          },
                        ),
                        40.ph,

                        // button send
                        PublicButton(
                          title: S.of(context).send,
                          width: 350.w,
                          onPressed: () {
                            // To dismiss keyboard
                            FocusScope.of(context).unfocus();
                            cubit.forgotPassword();
                          },
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
