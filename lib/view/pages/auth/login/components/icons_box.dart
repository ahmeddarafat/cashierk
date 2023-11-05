import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../resources/styles/app_colors.dart';

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
