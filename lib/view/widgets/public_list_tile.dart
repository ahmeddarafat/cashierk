import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../resources/styles/app_colors.dart';
import 'public_text.dart';

class PublicListTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color? iconColor;
  final double? iconSize;
  final double? txtSize;
  final void Function()? onTap;
  const PublicListTile({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
    this.iconSize,
    this.txtSize,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      onTap: onTap,
      leading: Hero(
        tag: title,
        child: Icon(
          icon,
          color: iconColor ?? AppColors.orangePrimary,
          size: 22.w,
        ),
      ),
      title: PublicText(
        txt: title,
        size: txtSize ?? 16.sp,
      ),
      trailing: Icon(
        Icons.arrow_forward_ios_outlined,
        color: iconColor ?? AppColors.orangePrimary,
        size: 22.w,
      ),
    );
  }
}
