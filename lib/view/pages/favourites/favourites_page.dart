import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/dummy_data/dummy_data.dart';
import '../../../resources/constants/app_constants.dart';
import '../../../resources/localization/generated/l10n.dart';
import '../../widgets/public_text.dart';
import '../../widgets/item_card.dart';

class FavouritesPage extends StatelessWidget {
  const FavouritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 60.h,
          title: PublicText(
            txt: S.of(context).favourites,
            fw: FontWeight.bold,
            size: 22.sp,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: GridView.builder(
            itemCount: AppConstants.items.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 170 / 220,
            ),
            itemBuilder: (_, index) {
              return ItemCard(item: DummyData.items[index]);
            },
          ),
        ),
      ),
    );
  }
}
