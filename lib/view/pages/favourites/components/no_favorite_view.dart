part of '../favourites_page.dart';

class NoFavoriteView extends StatelessWidget {
  const NoFavoriteView({super.key});
  
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
            txt: S.of(context).noFavoriteTitle,
            size: 24.sp,
            align: TextAlign.center,
          ),
          10.ph,
          PublicText(
            txt: S.of(context).noFavoriteSubtitle,
            color: AppColors.grey,
            align: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
