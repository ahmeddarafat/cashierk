import 'package:start_app/data/data_source/local/app_prefs.dart';
import 'package:start_app/resources/service_locator/service_locator.dart';

import '../data_source/remote/api_service.dart';
import '../network/custom_exception.dart';
import '../network/error_handler.dart';
import '../network/network_info.dart';

class ScanRepository {
  final NetworkInfo _networkInfo;
  final ApiService _apiService;
  late AppPrefs _appPrefs;

  ScanRepository({
    required NetworkInfo networkInfo,
    required ApiService apiService,
  })  : _networkInfo = networkInfo,
        _apiService = apiService {
    _appPrefs = getIt<AppPrefs>();
  }

  Future<void> createNewOrder() async {
    if (await _networkInfo.isConnected) {
      try {
        await _apiService.postData(
          endPoint: EndPoints.newOrder,
          body: {},
          token: _appPrefs.getToken(),
        );
      } catch (error) {
        final failure = ErrorHandler.handle(error).failure;
        throw CustomException(failure.message);
      }
    } else {
      throw CustomException("Check your network connection");
    }
  }
}
