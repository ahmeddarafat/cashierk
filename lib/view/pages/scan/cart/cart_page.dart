import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:start_app/data/models/remote/order/order_model.dart';
import 'package:start_app/resources/extensions/app_extensions.dart';
import 'package:start_app/resources/router/app_router.dart';
import 'package:start_app/view/pages/payment/payment_webview.dart';
import 'package:start_app/view/widgets/public_button.dart';
import 'package:start_app/view/widgets/public_divider.dart';
import 'package:start_app/view_model/scan/cart/cart_viewmodel.dart';

import '../../../../resources/localization/generated/l10n.dart';
import '../../../../resources/styles/app_colors.dart';
import '../../../widgets/custom_price_row.dart';
import '../../../widgets/public_snack_bar.dart';
import '../../../widgets/public_text.dart';

part 'components/order_item_row.dart';

class CartPage extends StatefulWidget {
  final OrderModel order;
  const CartPage({
    super.key,
    required this.order,
  });

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late final CartViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = CartViewModel.getInstance(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartViewModel, CartState>(
      listener: (_, state) {
        if (state is CartErrorState) {
          MySnackBar.error(
            message: state.message,
            color: AppColors.red,
            context: context,
          );
        } else if (state is CartSuccessState) {
          Navigator.pushNamed(
            context,
            AppRoutes.payment,
            arguments: state.paymentToken,
          );
        }
      },
      child: _cartContent(context),
    );
  }

  SafeArea _cartContent(BuildContext context) {
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
                  itemCount: widget.order.items.length,
                  itemBuilder: (_, index) {
                    return OrderItemRow(item: widget.order.items[index]);
                  },
                  separatorBuilder: (_, __) => Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.h),
                    child: const PublicDivider(),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.h, left: 15.w, right: 15.w),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomPriceRow(
                      title: S.of(context).subtotal,
                      price: widget.order.totalPrice,
                      color: AppColors.grey,
                      size: 16.sp,
                    ),
                    10.ph,
                    CustomPriceRow(
                      title: S.of(context).taxes,
                      price: "0",
                      color: AppColors.grey,
                      size: 14.sp,
                    ),
                    10.ph,
                    CustomPriceRow(
                      title: S.of(context).total,
                      price: widget.order.totalPrice,
                      size: 18.sp,
                    ),
                    15.ph,
                    BlocBuilder<CartViewModel, CartState>(
                      builder: (context, state) {
                        if (state is CartLoadingState) {
                          return Container(
                            height: 50.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: AppColors.orangePrimary,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Center(
                              child: CircularProgressIndicator(
                                color: AppColors.white,
                              ),
                            ),
                          );
                        } else {
                          return PublicButton(
                            title: S.of(context).proceedCheckout,
                            onPressed: () {
                              _viewModel.checkout(widget.order.totalPrice);
                            },
                          );
                        }
                      },
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
