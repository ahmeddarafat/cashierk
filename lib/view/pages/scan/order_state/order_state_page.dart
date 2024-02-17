import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:start_app/resources/constants/app_assets.dart';
import 'package:start_app/resources/extensions/app_extensions.dart';
import 'package:start_app/resources/styles/app_colors.dart';
import 'package:start_app/view/widgets/public_button.dart';
import 'package:start_app/view/widgets/public_outline_button.dart';
import 'package:start_app/view/widgets/public_text.dart';

import '../../../../resources/localization/generated/l10n.dart';
import '../../../../resources/router/app_router.dart';

class OrderStatePage extends StatelessWidget {
  final bool isSuccess;
  const OrderStatePage({super.key, required this.isSuccess});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  isSuccess ? Assets.imagesSuccess : Assets.imagesFailure,
                  height: 140.h,
                  width: 140.h,
                ),
                40.ph,
                PublicText(
                  txt: isSuccess
                      ? S.of(context).orderSuccessful
                      : S.of(context).orderFaild,
                  size: 24.sp,
                ),
                10.ph,
                PublicText(
                  txt: isSuccess
                      ? S.of(context).orderSuccessfulSubtitle
                      : S.of(context).orderFaildSubtitle,
                  color: AppColors.grey,
                  align: TextAlign.center,
                ),
                100.ph,
                PublicButton(
                  onPressed: () => isSuccess ? _trackMyOrder : _tryAgain,
                  title: isSuccess
                      ? S.of(context).trackMyOrder
                      : S.of(context).tryAgain,
                ),
                20.ph,
                PublicOutlineButton(
                  title: S.of(context).backToHome,
                  onPressed: () {
                    Navigator.popUntil(
                      context,
                      (route) => route.settings.name == AppRoutes.layouts,
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _trackMyOrder(BuildContext context) {
    Navigator.popUntil(
      context,
      (route) => route.settings.name == AppRoutes.layouts,
    );
  }

  void _tryAgain(BuildContext context) {
    log("try again");
    Navigator.pop(context);
  }
}
