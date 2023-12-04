import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter/material.dart';
import 'package:start_app/resources/styles/app_colors.dart';

class PublicText extends StatelessWidget {
  final String txt;
  final bool? under;
  final Color? color;
  final double? size;
  final int? max;
  final FontWeight? fw;
  final TextAlign? align;
  final double? letterSpacing;
  final double? wordSpacing;

  const PublicText({
    super.key,
    required this.txt,
    this.color,
    this.size,
    this.under,
    this.align,
    this.max,
    this.fw,
    this.letterSpacing,
    this.wordSpacing,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      txt,
      textAlign: align ?? TextAlign.start,
      maxLines: max ?? 2,
      style: TextStyle(
        color: color ?? AppColors.black,
        fontSize: size ?? 16.sp,
        height: 1.32,
        fontWeight: fw ?? FontWeight.normal,
        decoration:
            under == true ? TextDecoration.underline : TextDecoration.none,
        overflow: TextOverflow.ellipsis,
        letterSpacing: letterSpacing,
        wordSpacing: wordSpacing,
      ),
    );
  }
}
