import 'dart:developer';

import 'package:dio/dio.dart';
import '../models/order_entity.dart';

import '../data_source/local/app_prefs.dart';
import '../constants/api_constants.dart';
import '../data_source/remote/api_service.dart';
import '../models/order_model.dart';
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

  Future<List<OrderEntity>> getAllOrder() async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _apiService.getData(
          endPoint: EndPoints.orders,
          token: _appPrefs.getToken(),
        );
        return _modelingOrder(response);
      } catch (error) {
        log(error.toString(), name: "RecepitsRepository");
        final failure = ErrorHandler.handle(error).failure;
        throw CustomException(failure.message);
      }
    } else {
      throw CustomException("Check your network connection");
    }
  }

  List<OrderEntity> _modelingOrder(Response<dynamic> response) {
    return (response.data as List).map((order) {
      final model = Order.fromMap(order);
      return OrderEntity.fromModel(model);
    }).toList();
  }
}
