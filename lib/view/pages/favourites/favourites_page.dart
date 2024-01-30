import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:start_app/view_model/home/home_cubit.dart';

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
          child: BlocBuilder<HomeCubit, HomeState>(
            buildWhen: (_,current)=> current is ChangeFavoriteState,
            builder: (context, state) {
             var bloc = HomeCubit.getInstance(context);
              return GridView.builder(
                itemCount: bloc.favoirteItems.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 170 / 220,
                ),
                itemBuilder: (_, index) {
                  return ItemCard(item: bloc.favoirteItems[index]);
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
