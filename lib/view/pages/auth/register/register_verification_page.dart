import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

import '../../../../resources/constants/app_assets.dart';
import '../../../../resources/extensions/app_extensions.dart';
import '../../../../resources/localization/generated/l10n.dart';
import '../../../../resources/styles/app_colors.dart';
import '../../../../view_model/auth/register/register_cubit.dart';
import '../../../widgets/public_button.dart';
import '../../../widgets/public_text.dart';
import 'components/register_verfication_bloc_listener.dart';

class RegisterVerificationPage extends StatefulWidget {
  const RegisterVerificationPage({super.key});

  @override
  State<RegisterVerificationPage> createState() =>
      _RegisterVerificationPageState();
}

class _RegisterVerificationPageState extends State<RegisterVerificationPage> {
  @override
  Widget build(BuildContext context) {
    final bloc = RegisterCubit.getInstance(context);

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              right: 25.w,
              left: 25.w,
              bottom: 20.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // bloc listener
                const RegisterVerificationBlocListener(),

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
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  textFieldAlignment: MainAxisAlignment.spaceAround,
                  fieldStyle: FieldStyle.box,
                  onChanged: (otp) {
                    bloc.setOtp(otp);
                  },
                ),
                40.ph,

                // button send
                PublicButton(
                  title: S.of(context).verify,
                  width: 350.w,
                  onPressed: () {
                    bloc.verifyEmail();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
