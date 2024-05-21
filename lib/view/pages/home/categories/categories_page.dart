import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../resources/extensions/app_extensions.dart';
import '../../../widgets/public_text_form_field.dart';
import '../../../../view_model/home/home_cubit.dart';

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
              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  return SizedBox(
                    height: 40.h,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: AppConstants.categoriesNames.length,
                      itemBuilder: (_, index) {
                        return ChoiceChip(
                          backgroundColor: index == bloc.selectedLabelIndex
                              ? AppColors.orangePrimary
                              : AppColors.white,
                          selectedColor: index == bloc.selectedLabelIndex
                              ? AppColors.orangePrimary
                              : AppColors.white,
                          selected: index == bloc.selectedLabelIndex,
                          showCheckmark: false,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          label: PublicText(
                            txt: AppConstants.categoriesNames[index],
                            fw: FontWeight.w600,
                            size: 13.sp,
                            color: bloc.selectedLabelIndex == index
                                ? AppColors.white
                                : AppColors.orangePrimary,
                          ),
                          onSelected: (_) {
                            if (index == 0) {
                              bloc.removeFilter();
                            } else {
                              bloc.filterItemsByLabel(
                                AppConstants.categoriesNames[index],
                                index,
                              );
                            }
                          },
                        );
                      },
                      separatorBuilder: (_, __) => 10.pw,
                    ),
                  );
                },
              ),
              20.ph,

              /// Search
              PublicTextFormField(
                hint: S.of(context).search,
                validator: null,
                showprefixIcon: true,
                prefixIcon: Icons.search,
                onChanged: (str) {
                  bloc.filterItemsBySearch(str);
                },
              ),
              20.ph,

              /// items
              BlocBuilder<HomeCubit, HomeState>(
                buildWhen: (_, current) {
                  return current is FilterItemsState;
                },
                builder: (context, state) {
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: bloc.filteredItems.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 170 / 220,
                    ),
                    itemBuilder: (_, index) {
                      return ItemCard(item: bloc.filteredItems[index]);
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
