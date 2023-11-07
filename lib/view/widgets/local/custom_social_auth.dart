import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../resources/constants/app_assets.dart';
import '../../../resources/styles/app_colors.dart';

class CustomSocialAuth extends StatelessWidget {
  const CustomSocialAuth({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 251.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: () {
              // TODO: 'data, logic' login with facebook
            },
            child: IconsBox(
              image: Image.asset(
                Assets.iconsFacebook,
                height: 30.h,
                width: 30.w,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              // TODO: 'data, logic' login with google
            },
            child: IconsBox(
              image: Image.asset(
                Assets.iconsGoogle,
                height: 30.h,
                width: 30.w,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              // TODO: 'data, logic' login with apple
            },
            child: IconsBox(
              image: Image.asset(
                Assets.iconsApple,
                height: 30.h,
                width: 30.w,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class IconsBox extends StatelessWidget {
  final Image? image;
  const IconsBox({super.key, this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 57.h,
      width: 64.w,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(15.sp),
        boxShadow: const [
          BoxShadow(
            color: AppColors.lightGrey,
            spreadRadius: 0.6,
            blurRadius: 4,
          ),
        ],
      ),
      child: Center(child: image),
    );
  }
}
