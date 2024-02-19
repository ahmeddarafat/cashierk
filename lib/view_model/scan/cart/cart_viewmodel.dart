
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/data_source/local/app_prefs.dart';
import '../../../data/repository/payment_repository.dart';
import '../../../resources/service_locator/service_locator.dart';

import '../../../data/network/custom_exception.dart';

part 'cart_state.dart';

class CartViewModel extends Cubit<CartState> {
  final PaymentRepository repo;
  late final AppPrefs _appPrefs;

  CartViewModel(this.repo) : super(const CartInitState()) {
    _appPrefs = getIt<AppPrefs>();
  }

  static CartViewModel getInstance(BuildContext context) => context.read();

  Future<void> checkout(double price) async {
    // because the gateway deals with cents (100 centes = 1 pound)
    final totalPrice = (price * 100).toString();
    try {
      emit(const CartLoadingState());
      final authToken = await repo.getAuthToken();
      final orderId = await repo.getOrderId(authToken, totalPrice);
      final paymentToken = await repo.getPaymenToken(
        authToken,
        totalPrice,
        orderId,
        _appPrefs.getOrderNumber(),
      );
      emit(CartSuccessState(paymentToken));
    } catch (error) {
      if (error is CustomException) {
        emit(CartErrorState(error.message));
      }
    }
  }
}
