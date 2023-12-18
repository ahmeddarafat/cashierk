import 'package:start_app/data/data_source/local/app_prefs.dart';
import 'package:start_app/data/data_source/remote/api_constants.dart';
import 'package:start_app/data/models/remote/order/order_model.dart';
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

  Future<String> createNewOrder() async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _apiService.postData(
          endPoint: EndPoints.newOrder,
          body: {},
          token: _appPrefs.getToken(),
        );
        return response.data[ApiVars.orderNumber];
      } catch (error) {
        final failure = ErrorHandler.handle(error).failure;
        throw CustomException(failure.message);
      }
    } else {
      throw CustomException("Check your network connection");
    }
  }

  Future<OrderModel> getOrderItems(String orderNumber) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _apiService.getData(
          endPoint: "${EndPoints.newOrder}/$orderNumber",
          token: _appPrefs.getToken(),
        );
        return OrderModel.fromMap(response.data);
      } catch (error) {
        final failure = ErrorHandler.handle(error).failure;
        throw CustomException(failure.message);
      }
    } else {
      throw CustomException("Check your network connection");
    }
  }
}
