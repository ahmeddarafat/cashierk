
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:start_app/resources/extensions/app_extensions.dart';

import '../../data/models/local/categories/item_model.dart';
import '../../resources/styles/app_colors.dart';
import 'public_text.dart';

class ItemCard extends StatelessWidget {
  final Item item;
  
  const ItemCard({
    super.key, required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: AppColors.backgroundGrey,
          ),
          boxShadow: const [
            BoxShadow(
              color: AppColors.lightGrey,
              spreadRadius: 0.6,
              blurRadius: 4,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Image.asset(
                  item.image,
                  height: 80.h,
                  fit: BoxFit.cover,
                ),
              ),
              10.ph,
              PublicText(txt: item.name),
              5.ph,
              PublicText(
                txt: item.amount,
                color: AppColors.grey,
                size: 14.sp,
              ),
              const Spacer(),
              PublicText(
                txt:
                    "\$ ${item.price.orAbout()}",
                color: AppColors.orangePrimary,
                size: 18.sp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
