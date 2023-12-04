import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../resources/localization/generated/l10n.dart';
import 'public_divider.dart';
import 'public_text.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        PublicDivider(
          width: 120.w,
        ),
        PublicText(
          txt: S.of(context).or,
          size: 18.sp,
        ),
        PublicDivider(
          width: 120.w,
        ),
      ],
    );
  }
}
