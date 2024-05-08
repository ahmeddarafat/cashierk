import 'package:cashier/view_model/scan/waiting/wating_viewmodel.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../data/repository/auth_repository.dart';
import '../../data/repository/payment_repository.dart';
import '../../data/repository/recepits_repository.dart';
import '../../data/data_source/local/app_prefs.dart';

import '../../data/network/network_info.dart';
import '../../data/repository/scan_repository.dart';

final GetIt getIt = GetIt.instance;

Future<void> initModule() async {
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

  /// waiting view model
  getIt.registerLazySingleton(
    () => WaitingViewModel(
      getIt(),
    ),
  );

  /// payment repository
  getIt.registerLazySingleton(
    () => PaymentRepository(
      networkInfo: getIt(),
      appPrefs: getIt(),
    ),
  );

  /// recepits repository
  getIt.registerLazySingleton(
    () => RecepitsRepository(
      networkInfo: getIt(),
      appPerfs: getIt(),
    ),
  );
}
