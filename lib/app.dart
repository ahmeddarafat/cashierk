import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'resources/localization/generated/l10n.dart';
import 'view_model/auth/login/login_cubit.dart';
import 'view_model/auth/reset_pass/reset_cubit.dart';
import 'view_model/home/home_cubit.dart';
import 'view_model/onboarding/onboarding_cubit.dart';
import 'view_model/recepits/recepits_viewmodel.dart';
import 'data/data_source/local/app_prefs.dart';
import 'resources/helper/navigation_service.dart';
import 'resources/styles/app_themes.dart';

import 'resources/router/app_router.dart';
import 'resources/service_locator/service_locator.dart';
import 'view_model/profile/notifications_settings/notification_settings_cubit.dart';
import 'view_model/profile/profile/profile_cubit.dart';
import 'view_model/notifications/notification_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => OnboardingCubit()),
          BlocProvider(create: (_) => ResetCubit(getIt())),
          BlocProvider(create: (_) => LoginCubit(getIt())),
          BlocProvider(create: (_) => ProfileCubit()),
          BlocProvider(create: (_) => RecepitsViewModel(getIt())),
          BlocProvider(create: (_) => HomeCubit()),
          BlocProvider(create: (_) => NotificationSettingsCubit()),
          BlocProvider(
            create: (_) => NotificationCubit(),
            lazy: false,
          ),
        ],
        child: MaterialApp(
          navigatorKey: NavigationService.navigatorKey, 
          debugShowCheckedModeBanner: false,
          title: 'Cashierc',
          theme: AppThemes.light,
          locale: const Locale("en", "US"),
          supportedLocales: S.delegate.supportedLocales,
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          scrollBehavior: ScrollConfiguration.of(context).copyWith(
            physics: const BouncingScrollPhysics(),
          ),
          onGenerateRoute: RouteGenerate.getRoute,
          initialRoute: getInitRoute(),
        ),
      ),
    );
  }

  String getInitRoute() {
    // for testing
    // return AppRoutes.login;
    AppPrefs appPrefs = getIt<AppPrefs>();
    if (appPrefs.isOnBoardingViewed()) {
      if (appPrefs.isUserLoggedIn()) {
        return AppRoutes.layouts;
      } else {
        return AppRoutes.login;
      }
    } else {
      return AppRoutes.onboarding;
    }
  }
}
