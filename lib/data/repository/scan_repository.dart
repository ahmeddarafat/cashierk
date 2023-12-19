import 'package:start_app/data/data_source/local/app_prefs.dart';
import 'package:start_app/data/data_source/remote/api_constants.dart';
import 'package:start_app/data/models/remote/order/order_model.dart';

import '../data_source/remote/api_service.dart';
import '../network/custom_exception.dart';
import '../network/error_handler.dart';
import '../network/network_info.dart';

class ScanRepository {
  final NetworkInfo _networkInfo;
  late final ApiService _apiService;
  late final AppPrefs _appPrefs;

  ScanRepository({
    required NetworkInfo networkInfo,
    required AppPrefs appPerfs,
  })  : _networkInfo = networkInfo,
        _appPrefs = appPerfs {
    _apiService = ApiService(EndPoints.serverBaseUrl);
  }

  Future<String> createNewOrder() async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _apiService.postData(
          endPoint: EndPoints.orders,
          body: {},
          token: _appPrefs.getToken(),
        );
        return response.data[ApiConstants.orderNumber];
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
          endPoint: "${EndPoints.orders}/$orderNumber",
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
