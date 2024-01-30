import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:start_app/resources/extensions/app_extensions.dart';
import 'package:start_app/view/widgets/public_text_form_field.dart';
import 'package:start_app/view_model/home/home_cubit.dart';

import '../../../../data/dummy_data/dummy_data.dart';
import '../../../../resources/constants/app_constants.dart';
import '../../../../resources/localization/generated/l10n.dart';
import '../../../../resources/styles/app_colors.dart';
import '../../../widgets/public_text.dart';
import '../../../widgets/item_card.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = HomeCubit.getInstance(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 60.h,
          title: PublicText(
            txt: S.of(context).categories,
            fw: FontWeight.bold,
            size: 22.sp,
          ),
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
          child: ListView(
            children: [
              /// categories
              SizedBox(
                height: 40.h,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: AppConstants.categoriesNames.length,
                  itemBuilder: (_, index) {
                    return ChoiceChip(
                      backgroundColor: AppColors.white,
                      selectedColor: AppColors.orangePrimary,
                      selected: index == 0,
                      showCheckmark: false,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      label: PublicText(
                        txt: AppConstants.categoriesNames[index],
                        fw: FontWeight.w600,
                        size: 13.sp,
                        color: 0 == index
                            ? AppColors.white
                            : AppColors.orangePrimary,
                      ),
                      onSelected: (_) {},
                    );
                  },
                  separatorBuilder: (_, __) => 10.pw,
                ),
              ),
              20.ph,

              /// Search
              PublicTextFormField(
                hint: S.of(context).search,
                validator: null,
                showprefixIcon: true,
                prefixIcon: Icons.search,
              ),
              20.ph,

              /// items
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: DummyData.items.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 170 / 220,
                ),
                itemBuilder: (_, index) {
                  return ItemCard(item: bloc.allItems[index]);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
