import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:start_app/data/dummy_data/dummy_data.dart';
import 'package:start_app/resources/extensions/app_extensions.dart';
import 'package:start_app/view/widgets/public_button.dart';
import 'package:start_app/view/widgets/public_divider.dart';

import '../../../../resources/localization/generated/l10n.dart';
import '../../../../resources/styles/app_colors.dart';
import 'public_text.dart';

class CustomPriceRow extends StatelessWidget {
  final String title;
  final double price;
  final Color? color;
  final double? size;
  const CustomPriceRow({
    super.key,
    required this.title,
    required this.price,
    this.color,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        PublicText(
          txt: title,
          color: color,
          size: size,
        ),
        const Spacer(),
        PublicText(
          txt: "\$${price.orAbout()}",
          color: color,
          size: size,
        ),
      ],
    );
  }
}
