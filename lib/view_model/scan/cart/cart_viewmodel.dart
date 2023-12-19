import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:start_app/data/repository/payment_repository.dart';

import '../../../data/network/custom_exception.dart';

part 'cart_state.dart';

class CartViewModel extends Cubit<CartState> {
  final PaymentRepository repo;

  CartViewModel(this.repo) : super(const CartInitState());

  static CartViewModel getInstance(BuildContext context) => context.read();

  Future<void> checkout(String price) async {
    // because the gateway deals with cents (100 centes = 1 pound)
    final totalPrice = (double.parse(price) * 100).toString();
    try {
      emit(const CartLoadingState());
      final authToken = await repo.getAuthToken();
      final orderId = await repo.getOrderId(authToken, totalPrice);
      final paymentToken =
          await repo.getPaymenToken(authToken, totalPrice, orderId);
      emit(CartSuccessState(paymentToken));
    } catch (error) {
      if (error is CustomException) {
        emit(CartErrorState(error.message));
      }
    }
  }
}
