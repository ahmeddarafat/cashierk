part of '../onboarding_page.dart';

class OnboardingItem extends StatelessWidget {
  final OnBoardingModel onBoarding;
  const OnboardingItem({
    super.key,
    required this.onBoarding,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SvgPicture.asset(
          onBoarding.image,
          height: 300.h,
          width: double.infinity,
        ),
        30.ph,
        PublicText(
          txt: onBoarding.title,
          color: AppColors.black,
          fw: FontWeight.bold,
          size: 20.sp,
        ),
        16.ph,
        PublicText(
          txt: onBoarding.description,
          max: 3,
          color: AppColors.grey,
          size: 16.sp,
          align: TextAlign.center,
        ),
      ],
    );
  }
}