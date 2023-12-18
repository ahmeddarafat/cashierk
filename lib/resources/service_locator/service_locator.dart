import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:start_app/data/repository/auth_repository.dart';
import '../../data/data_source/local/app_prefs.dart';

import '../../data/network/network_info.dart';
import '../../data/repository/scan_repository.dart';
import '../../view_model/bloc_observer.dart';

final GetIt getIt = GetIt.instance;

Future<void> initModule() async {
  Bloc.observer = MyBlocObserver();

  /// Shared prefs
  final sharedPrefs = await SharedPreferences.getInstance();
  getIt.registerLazySingleton(
    () => AppPrefs(sharedPrefs),
  );

  /// network Info
  getIt.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(
      InternetConnectionChecker(),
    ),
  );

  /// auth repository
  getIt.registerLazySingleton(
    () => AuthRepository(
      networkInfo: getIt(),
    ),
  );

  /// scan repository
  getIt.registerLazySingleton(
    () => ScanRepository(
      networkInfo: getIt(),
      appPerfs: getIt(),
    ),
  );
}
