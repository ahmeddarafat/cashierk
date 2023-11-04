import '../../data/models/local/onboarding_model.dart';
import '../localization/generated/l10n.dart';
import 'app_assets.dart';

class AppConstants {
  AppConstants._();

  static List<OnBoardingModel> onboardingContents = [
    OnBoardingModel(
      image: Assets.imagesOnboarding1,
      title: S.current.onboardingTitle1,
      description: S.current.onboardingSubtitle1,
    ),
    OnBoardingModel(
      image: Assets.imagesOnboarding2,
      title: S.current.onboardingTitle2,
      description: S.current.onboardingSubtitle2,
    ),
    OnBoardingModel(
      image: Assets.imagesOnboarding3,
      title: S.current.onboardingTitle3,
      description: S.current.onboardingSubtitle3,
    ),
  ];
}
