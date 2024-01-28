part of '../recepits_page.dart';

class OrderCard extends StatelessWidget {
  final Order order;
  const OrderCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150.h,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: AppColors.lightGrey,
            spreadRadius: 0.6,
            blurRadius: 4,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              PublicText(
                txt: order.shopName,
                size: 18.sp,
                fw: FontWeight.bold,
              ),
              const Spacer(),
              PublicText(
                txt: order.status,
                color: order.status == S.of(context).completed
                    ? Colors.green
                    : Colors.red,
              ),
            ],
          ),
          10.ph,
          PublicText(
            txt: order.notes,
            color: AppColors.grey,
            max: 3,
          ),
          const Spacer(),
          Row(
            children: [
              PublicText(
                txt: order.date.monthDayYearFormat,
                color: AppColors.grey,
              ),
              const Spacer(),
              PublicButton(
                width: 120.w,
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    AppRoutes.orderDetails,
                    arguments: order,
                  );
                },
                title: S.of(context).viewDetails,
                titleSize: 12.sp,
                verticalpadding: 6.h,
              )
            ],
          ),
        ],
      ),
    );
  }
}
