import 'package:cashier/view/pages/scan/get_order/components/get_order_bloc_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../resources/extensions/app_extensions.dart';
import '../../../../resources/styles/app_colors.dart';
import '../../../widgets/public_button.dart';
import '../../../widgets/public_text.dart';

class GetOrderPage extends StatelessWidget {
  const GetOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /// Bloc Listener
                const GetOrderBlocListener(),
                
                PublicText(
                  txt: "Ready to get your order?",
                  size: 20.sp,
                  fw: FontWeight.bold,
                ),
                10.ph,
                PublicText(
                  txt:
                      "You can get your order by stand in front of the camera and put your products on the table",
                  color: AppColors.grey,
                  size: 14.sp,
                  align: TextAlign.center,
                ),
                200.ph,
                PublicButton(
                  onPressed: () {},
                  title: "Get Order",
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
