import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:start_app/data/models/item_entity.dart';
import 'package:start_app/resources/extensions/app_extensions.dart';
import 'package:start_app/view_model/home/home_cubit.dart';

import '../../resources/styles/app_colors.dart';
import 'public_text.dart';

class ItemCard extends StatelessWidget {
  final ItemEntity item;

  const ItemCard({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    var bloc = HomeCubit.getInstance(context);

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
        child: Stack(
          children: [
            Padding(
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
                    txt: "${item.quantity} ${item.unit}",
                    color: AppColors.grey,
                    size: 14.sp,
                  ),
                  const Spacer(),
                  PublicText(
                    txt: "\$ ${double.parse(item.unitPrice).orAbout()}",
                    color: AppColors.orangePrimary,
                    size: 18.sp,
                  ),
                ],
              ),
            ),
            Positioned(
              right: 0,
              top: 0,
              child: BlocBuilder<HomeCubit, HomeState>(
                buildWhen: (_, current) {
                  if (current is ChangeFavoriteState && current.id == item.id) {
                    return true;
                  } else {
                    return false;
                  }
                },
                builder: (context, state) {
                  return IconButton(
                    onPressed: () {
                      bloc.changeFavorite(item.id);
                    },
                    icon: Icon(
                      item.isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: AppColors.orangePrimary,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
