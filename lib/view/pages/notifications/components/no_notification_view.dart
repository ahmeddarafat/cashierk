part of '../notifications_page.dart';

class NoNotificationsView extends StatelessWidget {
  const NoNotificationsView({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            Assets.imagesNoOrder,
            height: 140.h,
            width: 140.h,
          ),
          40.ph,
          PublicText(
            txt: S.of(context).noNotificationsTitle,
            size: 24.sp,
            align: TextAlign.center,
          ),
          10.ph,
        ],
      ),
    );
  }
}
