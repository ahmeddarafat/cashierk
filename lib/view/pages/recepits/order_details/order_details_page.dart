import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../data/models/order_entity.dart';
import '../../../../resources/extensions/app_extensions.dart';

import '../../../../resources/localization/generated/l10n.dart';
import '../../../../resources/styles/app_colors.dart';
import '../../../widgets/custom_price_row.dart';
import '../../../widgets/public_divider.dart';
import '../../../widgets/public_text.dart';
import '../../scan/cart/cart_page.dart';

part 'components/overview_info_row.dart';

class OrderDetailsPage extends StatelessWidget {
  final OrderEntity order;
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
                              txt: order.status.name,
                            ),
                            10.ph,
                            PublicText(
                              txt: order.time,
                              color: AppColors.grey,
                              size: 14.sp,
                            ),
                          ],
                        ),
                      ),
                      20.ph,

                      /// order overview
                      PublicText(
                        txt: S.of(context).overview,
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
                              description: order.id,
                            ),
                            10.ph,
                            OverViewInfoRow(
                              title: S.of(context).shopName,
                              description: order.shopName,
                            ),
                            10.ph,
                            OverViewInfoRow(
                              title: S.of(context).date,
                              description: order.date,
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
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: AppColors.lightGrey),
                        ),
                        child: ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: order.items.length,
                          itemBuilder: (_, index) {
                            return OrderItemRow(item: order.items[index]);
                          },
                          separatorBuilder: (_, __) => Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.h),
                            child: const PublicDivider(),
                          ),
                        ),
                      ),
                      20.ph,
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
                      price: order.subTotalPrice,
                      color: AppColors.grey,
                      size: 16.sp,
                    ),
                    10.ph,
                    CustomPriceRow(
                      title: S.of(context).taxes,
                      price: order.taxes,
                      color: AppColors.grey,
                      size: 14.sp,
                    ),
                    10.ph,
                    CustomPriceRow(
                      title: S.of(context).total,
                      price: order.totalPrice,
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
