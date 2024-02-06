import 'package:flutter/painting.dart';
import 'package:start_app/data/models/category_model.dart';

import '../../data/models/onboarding_model.dart';
import '../localization/generated/l10n.dart';
import 'app_assets.dart';

class AppConstants {
  AppConstants._();

  static final onboardingContents = [
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

  static final categories = [
    Category(
      image: Assets.imagesOrange,
      name: S.current.fruits,
      color: const Color(0xFFEED9B6),
    ),
    Category(
        image: Assets.imagesBrokly,
        name: S.current.vegetables,
        color: const Color(0xFF82DA9D)),
    Category(
      image: Assets.imagesMeat,
      name: S.current.meat,
      color: const Color(0xFFEE8686),
    ),
    Category(
      image: Assets.imagesChicken,
      name: S.current.chicken,
      color: const Color(0xFFF5D4A0),
    ),
    Category(
      image: Assets.imagesOrange,
      name: S.current.fruits,
      color: const Color(0xFFEED9B6),
    ),
    Category(
      image: Assets.imagesBrokly,
      name: S.current.vegetables,
      color: const Color(0xFFB4F7A3),
    ),
    Category(
      image: Assets.imagesMeat,
      name: S.current.meat,
      color: const Color(0xFFEE8686),
    ),
    Category(
      image: Assets.imagesChicken,
      name: S.current.chicken,
      color: const Color(0xFFF5D4A0),
    ),
  ];

  static final categoriesNames = [
    S.current.all,
    S.current.fruits,
    S.current.vegetables,
    S.current.meat,
    S.current.chicken,
    S.current.fruits,
    S.current.vegetables,
    S.current.meat,
    S.current.chicken,
  ];

}
