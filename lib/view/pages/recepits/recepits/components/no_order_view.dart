part of '../recepits_page.dart';

class NoOrderVeiw extends StatelessWidget {
  const NoOrderVeiw({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          Assets.imagesNoOrder,
          height: 140.h,
          width: 140.h,
        ),
        40.ph,
        PublicText(
          txt: S.of(context).noOrderTitle,
          size: 24.sp,
        ),
        10.ph,
        PublicText(
          txt: S.of(context).noOrderSubtitle,
          color: AppColors.grey,
          align: TextAlign.center,
        ),
      ],
    );
  }
}
