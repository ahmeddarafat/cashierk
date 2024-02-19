import '../data_source/local/app_prefs.dart';
import '../data_source/remote/api_service.dart';
import '../network/custom_exception.dart';
import '../network/network_info.dart';

import '../constants/api_constants.dart';
import '../network/error_handler.dart';

const apiKey =
    "ZXlKaGJHY2lPaUpJVXpVeE1pSXNJblI1Y0NJNklrcFhWQ0o5LmV5SmpiR0Z6Y3lJNklrMWxjbU5vWVc1MElpd2ljSEp2Wm1sc1pWOXdheUk2T0Rjd01ETTFMQ0p1WVcxbElqb2lhVzVwZEdsaGJDSjkuaVpIalFsbzdRT2h1T21EQ0FNWkloVGVaTDZDeXozV21ydmJvcm9hY3NaX2pXT1JFa2hxTFZkSzFRQzZka2dURjJ1UE9GTk1BTWhMemVRTWdzQXJBMXc=";

class IntegrationIds {
  IntegrationIds._();
  static const kioskId = "4077525";
  static const cardId = "4074138";
}

class PaymentRepository {
  late final ApiService _apiService;
  final NetworkInfo _networkInfo;
  final AppPrefs _appPrefs;

  PaymentRepository({
    required NetworkInfo networkInfo,
    required AppPrefs appPrefs,
  })  : _networkInfo = networkInfo,
        _appPrefs = appPrefs {
    _apiService = ApiService(EndPoints.paymentBaseUrl);
  }

  Future<String> getAuthToken() async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _apiService.postData(
          endPoint: EndPoints.authToken,
          body: {
            ApiConstants.apiKey: apiKey,
          },
        );
        return response.data?[ApiConstants.token] ?? "";
      } catch (error) {
        final handler = ErrorHandler.handle(error);
        final failure = handler.failure;
        throw CustomException(failure.message);
      }
    } else {
      throw CustomException("Check your network connection");
    }
  }

  Future<String> getOrderId(String authToken, String price) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _apiService.postData(
          endPoint: EndPoints.orderId,
          body: {
            ApiConstants.authToken: authToken,
            ApiConstants.deliveryNeeded: "false",
            ApiConstants.amountCents: price,
            ApiConstants.currency: "EGP",
            ApiConstants.items: [],
          },
        );
        return response.data?["id"].toString() ?? "";
      } catch (error) {
        final handler = ErrorHandler.handle(error);
        final failure = handler.failure;
        throw CustomException(failure.message);
      }
    } else {
      throw CustomException("Check your network connection");
    }
  }

  Future<String> getPaymenToken(String authToken, String price, String orderId,
      String orderNumber) async {
    if (await _networkInfo.isConnected) {
      final userInfo = _appPrefs.getUserInfo();
      try {
        final response = await _apiService.postData(
          endPoint: EndPoints.paymentId,
          body: {
            ApiConstants.authToken: authToken,
            ApiConstants.amountCents: price,
            ApiConstants.expiration: 8000,
            ApiConstants.orderId: orderId,
            ApiConstants.currency: "EGP",
            ApiConstants.integrationId: IntegrationIds.cardId,
            "billing_data": {
              "street": orderNumber,
              "first_name": userInfo.name.split(" ").first,
              "last_name": userInfo.name.split(" ").last,
              "email": userInfo.email,
              "phone_number": "+86(8)9135210487",
              "apartment": "NA",
              "floor": "NA",
              "building": "NA",
              "postal_code": "NA",
              "shipping_method": "NA",
              "city": "NA",
              "country": "NA",
              "state": "NA"
            },
          },
        );
        return response.data?[ApiConstants.token] ?? "";
      } catch (error) {
        final handler = ErrorHandler.handle(error);
        final failure = handler.failure;
        throw CustomException(failure.message);
      }
    } else {
      throw CustomException("Check your network connection");
    }
  }
}
