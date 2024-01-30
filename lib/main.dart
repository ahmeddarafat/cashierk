import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:start_app/resources/localization/generated/l10n.dart';
import 'package:start_app/view_model/auth/login/login_cubit.dart';
import 'package:start_app/view_model/auth/reset_pass/reset_cubit.dart';
import 'package:start_app/view_model/home/home_cubit.dart';
import 'package:start_app/view_model/onboarding/onboarding_cubit.dart';
import 'package:start_app/view_model/recepits/recepits_viewmodel.dart';
import 'data/data_source/local/app_prefs.dart';
import 'resources/observers/bloc_observer.dart';
import 'resources/styles/app_themes.dart';

import 'resources/router/app_router.dart';
import 'resources/service_locator/service_locator.dart';
import 'view_model/profile/profile/profile_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );

  await initModule();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => OnboardingCubit()),
          BlocProvider(create: (_) => ResetCubit()),
          BlocProvider(create: (_) => LoginCubit(getIt())),
          BlocProvider(create: (_) => ProfileCubit()),
          BlocProvider(create: (_) => RecepitsViewModel(getIt())),
          BlocProvider(create: (_) => HomeCubit()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Cashierk',
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



  /// notes
  
  /// 1. remove the cache data to reset the app
  /// var appDir = (await getApplicationDocumentsDirectory()).path;
  /// Directory(appDir).delete(recursive: true);