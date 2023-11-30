import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'public_text.dart';

class PublicTitleTile extends StatelessWidget {
  final String title;
  final VoidCallback? seeAllOnTap;
  const PublicTitleTile({
    super.key,
    required this.title,
    this.seeAllOnTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 0),
      leading: PublicText(
        txt: title,
        size: 20.sp,
        fw: FontWeight.w600,
      ),
      trailing: InkWell(
        onTap: seeAllOnTap,
        child: PublicText(
          txt: "See More",
          size: 14.sp,
          fw: FontWeight.normal,
          color: Colors.orange,
        ),
      ),
    );
  }
}
