import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import '../../resources/styles/app_colors.dart';

class PublicDivider extends StatelessWidget {
  final double? width;
  final Color? color;
  const PublicDivider({super.key, this.width, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color ?? AppColors.backgroundGrey,
      height: 0.8,
      width: width ?? 300.w,
    );
  }
}