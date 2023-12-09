import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:start_app/data/dummy_data/dummy_data.dart';
import 'package:start_app/resources/extensions/app_extensions.dart';
import 'package:start_app/resources/router/app_router.dart';
import 'package:start_app/view/widgets/public_button.dart';
import 'package:start_app/view/widgets/public_divider.dart';

import '../../../../resources/localization/generated/l10n.dart';
import '../../../../resources/styles/app_colors.dart';
import '../../../widgets/custom_price_row.dart';
import '../../../widgets/public_text.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 80.h,
          title: PublicText(
            txt: S.of(context).cart,
            fw: FontWeight.bold,
            size: 22.sp,
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new_outlined,
              color: AppColors.orangePrimary,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
          child: Column( 
            children: [
              Expanded(
                child: ListView.separated(
                  itemCount: DummyData.cartItems.length,
                  itemBuilder: (_, index) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          height: 60.w,
                          width: 60.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: AppColors.backgroundGrey,
                          ),
                          child: Image.asset(DummyData.cartItems[index].image),
                        ),
                        16.pw,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            PublicText(
                              txt: DummyData.cartItems[index].name,
                              size: 18.sp,
                            ),
                            4.ph,
                            PublicText(
                              txt:
                                  "Quntities: ${DummyData.cartItems[index].amount}",
                              color: AppColors.grey,
                              size: 12.sp,
                            ),
                            4.ph,
                            PublicText(
                              txt: DummyData.cartItems[index].price,
                              size: 14.sp,
                            ),
                          ],
                        ),
                        const Spacer(),
                        PublicText(
                          txt:
                              "\$ ${DummyData.cartItems[index].totalPrice.orAbout()}",
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (_, __) => Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.h),
                    child: const PublicDivider(),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.h),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomPriceRow(
                      title: S.of(context).subtotal,
                      price: 22,
                      color: AppColors.grey,
                      size: 16.sp,
                    ),
                    10.ph,
                    CustomPriceRow(
                      title: S.of(context).taxes,
                      price: 2.5,
                      color: AppColors.grey,
                      size: 14.sp,
                    ),
                    10.ph,
                    CustomPriceRow(
                      title: S.of(context).total,
                      price: 24.5,
                      size: 18.sp,
                    ),
                    10.ph,
                    PublicButton(
                      onPressed: () {
                        // TODO: "logic - should go to payment"
                        Navigator.pushNamed(
                          context,
                          AppRoutes.orderState,
                          arguments: true,
                        );
                      },
                      title: S.of(context).proceedCheckout,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
