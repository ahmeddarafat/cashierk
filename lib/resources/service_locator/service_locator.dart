import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:start_app/data/data_source/local/app_prefs.dart';
import 'package:start_app/data/data_source/remote/api_service.dart';

import '../../data/network/network_info.dart';

final GetIt getIt = GetIt.instance;

Future<void> initModule() async {
  // Bloc.observer = MyBlocObserver();

  /// Shared prefs
  final sharedPrefs = await SharedPreferences.getInstance();
  getIt.registerLazySingleton(
    () => AppPrefs(sharedPrefs),
  );

  /// api service
  getIt.registerLazySingleton(
    () => ApiService(),
  );

  /// network Info
  getIt.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(
      InternetConnectionChecker(),
    ),
  );
}
