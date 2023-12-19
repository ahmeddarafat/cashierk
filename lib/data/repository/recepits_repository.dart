import '../data_source/local/app_prefs.dart';
import '../data_source/remote/api_constants.dart';
import '../data_source/remote/api_service.dart';
import '../models/remote/order/order_model.dart';
import '../network/custom_exception.dart';
import '../network/error_handler.dart';
import '../network/network_info.dart';

class RecepitsRepository {
  final NetworkInfo _networkInfo;
  late final ApiService _apiService;
  late final AppPrefs _appPrefs;

  RecepitsRepository({
    required NetworkInfo networkInfo,
    required AppPrefs appPerfs,
  })  : _networkInfo = networkInfo,
        _appPrefs = appPerfs {
    _apiService = ApiService(EndPoints.serverBaseUrl);
  }

  Future<List<OrderModel>> getAllOrder() async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _apiService.getData(
          endPoint: EndPoints.orders,
          token: _appPrefs.getToken(),
        );
        return (response.data as List).map((order) {
          return OrderModel.fromMap(order);
        }).toList();
      } catch (error) {
        final failure = ErrorHandler.handle(error).failure;
        throw CustomException(failure.message);
      }
    } else {
      throw CustomException("Check your network connection");
    }
  }
}
