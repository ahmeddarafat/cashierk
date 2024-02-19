import 'package:flutter/material.dart';

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
          txt: "\$$price",
          color: color,
          size: size,
        ),
      ],
    );
  }
}
