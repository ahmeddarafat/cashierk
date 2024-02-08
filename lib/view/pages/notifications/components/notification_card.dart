part of '../notifications_page.dart';

class NotificationCard extends StatelessWidget {
  final NotificationModel notification;
  const NotificationCard({
    super.key,
    required this.notification,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
        height: 86.h,
        width: 394.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.white,
          boxShadow: const [
            BoxShadow(
              color: AppColors.lightGrey,
              spreadRadius: 0.6,
              blurRadius: 4,
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.orangePrimary),
                shape: BoxShape.circle
              ),
              child: Icon(
                Icons.priority_high_rounded,
                size: 35.w,
                color: AppColors.orangePrimary,
              ),
            ),
            15.pw,
            SizedBox(
              width: MediaQuery.sizeOf(context).width - 2 * 32.w - 50.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: PublicText(
                          txt: notification.title,
                          fw: FontWeight.w500,
                          size: 18.sp,
                        ),
                      ),
                      PublicText(
                        txt: notification.date.monthDayYearFormat,
                        size: 13.sp,
                        color: AppColors.grey,
                      ),
                    ],
                  ),
                  5.ph,
                  PublicText(
                    txt: notification.body,
                    size: 16.sp,
                    fw: FontWeight.w400,
                    color: AppColors.grey,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
