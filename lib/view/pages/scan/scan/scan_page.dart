

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../resources/constants/app_assets.dart';
import '../../../../resources/extensions/app_extensions.dart';
import '../../../../resources/localization/generated/l10n.dart';
import '../../../../resources/router/app_router.dart';
import '../../../../resources/styles/app_colors.dart';
import '../../../widgets/public_button.dart';
import '../../../widgets/public_text.dart';


@Deprecated("This is the old version of the ScanPage, use the waiting page instead")
class ScanPage extends StatelessWidget {
  const ScanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PublicText(
                  txt: S.of(context).scanTitle,
                  size: 20.sp,
                  fw: FontWeight.bold,
                ),
                10.ph,
                PublicText(
                  txt: S.of(context).scanSubtitle,
                  color: AppColors.grey,
                  size: 14.sp,
                  align: TextAlign.center,
                ),
                50.ph,
                Image.asset(
                  Assets.imagesQrCode,
                  height: 100.h,
                  width: 100.h,
                ),
                100.ph,
                PublicButton(
                  onPressed: ()  {
                    Navigator.pushNamed(context, AppRoutes.qrView);
                  },
                  title: S.of(context).scanNow,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
