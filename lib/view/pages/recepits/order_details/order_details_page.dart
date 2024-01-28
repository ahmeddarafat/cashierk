import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:start_app/resources/extensions/app_extensions.dart';

import '../../../../data/models/order_model.dart';
import '../../../../resources/localization/generated/l10n.dart';
import '../../../../resources/styles/app_colors.dart';
import '../../../widgets/custom_price_row.dart';
import '../../../widgets/public_divider.dart';
import '../../../widgets/public_text.dart';
import '../../scan/cart/cart_page.dart';

part 'components/overview_info_row.dart';

class OrderDetailsPage extends StatelessWidget {
  final Order order;
  const OrderDetailsPage({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 80.h,
          title: PublicText(
            txt: order.shopName,
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
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// order Status
                      PublicText(
                        txt: S.of(context).OrderStatus,
                        size: 18.sp,
                      ),
                      15.ph,
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: AppColors.lightGrey)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            PublicText(
                              txt: S.of(context).received,
                            ),
                            10.ph,
                            PublicText(
                              txt: order.date.timeFormat,
                              color: AppColors.grey,
                              size: 14.sp,
                            ),
                          ],
                        ),
                      ),
                      20.ph,

                      /// order overview
                      PublicText(
                        txt: S.of(context).OrderStatus,
                        size: 18.sp,
                      ),
                      15.ph,
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: AppColors.lightGrey),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            OverViewInfoRow(
                              title: S.of(context).orderId,
                              description: "230320342",
                            ),
                            10.ph,
                            OverViewInfoRow(
                              title: S.of(context).shopName,
                              description: order.shopName,
                            ),
                            10.ph,
                            OverViewInfoRow(
                              title: S.of(context).date,
                              description: order.date.monthDayYearFormat,
                            ),
                            10.ph,
                            OverViewInfoRow(
                              title: S.of(context).notes,
                              description: order.notes,
                            ),
                          ],
                        ),
                      ),
                      20.ph,

                      /// order Summary
                      PublicText(
                        txt: S.of(context).orderSummary,
                        size: 18.sp,
                      ),
                      15.ph,
                      // TODO: "UI - complete order summary"
                      Container(
                        width: double.infinity,
                        height: 50.h,
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: AppColors.lightGrey),
                        ),
                        child: ListView.separated(
                          itemCount: order.items.length,
                          itemBuilder: (_, index) {
                            return OrderItemRow(
                                item: order.items[index]);
                          },
                          separatorBuilder: (_, __) => Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.h),
                            child: const PublicDivider(),
                          ),
                        ),
                      ),
                      20.ph,

                      // /// payment method
                      // PublicText(
                      //   txt: S.of(context).paymentMethod,
                      //   size: 18.sp,
                      // ),
                      // 15.ph,
                      // // TODO: "UI - complete payment method"
                      // Container(
                      //   width: double.infinity,
                      //   height: 50.h,
                      //   padding: const EdgeInsets.all(8),
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(12),
                      //     border: Border.all(color: AppColors.lightGrey),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),

              /// Pricing
              Padding(
                padding: EdgeInsets.only(top: 10.h),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomPriceRow(
                      title: S.of(context).subtotal,
                      price: order.subTotalPrice.toString(),
                      color: AppColors.grey,
                      size: 16.sp,
                    ),
                    10.ph,
                    CustomPriceRow(
                      title: S.of(context).taxes,
                      price: order.taxes.toString(),
                      color: AppColors.grey,
                      size: 14.sp,
                    ),
                    10.ph,
                    CustomPriceRow(
                      title: S.of(context).total,
                      price: order.totalPrice.toString(),
                      size: 18.sp,
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
