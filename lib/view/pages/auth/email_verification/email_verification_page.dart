import 'package:flutter_svg/svg.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:start_app/resources/constants/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:start_app/resources/extensions/app_extensions.dart';
import 'package:start_app/resources/localization/generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:start_app/view_model/auth/reset_pass/reset_cubit.dart';

import '../../../../resources/router/app_router.dart';
import '../../../../resources/styles/app_colors.dart';
import '../../../widgets/public_button.dart';
import '../../../widgets/public_snack_bar.dart';
import '../../../widgets/public_text.dart';

class EmailVerificationPage extends StatelessWidget {
  late String otp;
  EmailVerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = ResetCubit.getInstance(context);
    return BlocConsumer<ResetCubit, ResetState>(
      listenWhen: (_, current) {
        return (current is VerifyEmailState || current is ResetErrorState);
      },
      buildWhen: (_, current) {
        return (current is VerifyEmailState || current is ResetErrorState);
      },
      listener: (context, state) {
        if (state is VerifyEmailLoadingState) {
          cubit.changeSnipper();
        } else {
          if (cubit.spinner) {
            cubit.changeSnipper();
          }
          if (state is ResetErrorState) {
            MySnackBar.error(
                message: state.error, color: Colors.red, context: context);
          } else if (state is VerifyEmailSuccessState) {
            Navigator.pushNamed(
              context,
              AppRoutes.resetPassword,
            );
          }
        }
      },
      builder: (context, state) {
        if (state is! VerifyEmailSuccessState) {
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //img
                      SvgPicture.asset(
                        Assets.imagesOtp,
                        height: 250.h,
                        width: double.infinity,
                      ),
                      10.ph,

                      /// email verification title
                      PublicText(
                        txt: S.of(context).otpTitle,
                        fw: FontWeight.bold,
                        size: 20.sp,
                      ),
                      10.ph,

                      /// email verification subtitle
                      PublicText(
                        txt: S.of(context).otpSubtitle,
                        color: AppColors.grey,
                        fw: FontWeight.w400,
                        align: TextAlign.center,
                      ),
                      40.ph,

                      //otp text field
                      OTPTextField(
                        length: 6,
                        width: double.infinity,
                        fieldWidth: 40.w,
                        style: TextStyle(
                          fontSize: 35.sp,
                          fontWeight: FontWeight.w400,
                        ),
                        textFieldAlignment: MainAxisAlignment.spaceAround,
                        fieldStyle: FieldStyle.box,
                        onChanged: (otp) {
                          this.otp = otp;
                        },
                      ),
                      40.ph,

                      // button send
                      PublicButton(
                        title: S.of(context).verify,
                        width: 350.w,
                        onPressed: () {
                          cubit.verifyEmail(otp);
                        },
                      ),
                    ],
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
