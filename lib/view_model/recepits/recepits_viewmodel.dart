import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:start_app/data/models/order_entity.dart';
import 'package:start_app/data/models/order_model.dart';
import 'package:start_app/data/repository/recepits_repository.dart';

import '../../data/network/custom_exception.dart';

part 'recepits_state.dart';

class RecepitsViewModel extends Cubit<RecepitsState> {
  final RecepitsRepository repo;
  late final List<OrderEntity> allOrders;

  RecepitsViewModel(this.repo) : super(const RecepitsInitState()) {
    allOrders = [];
  }

  static RecepitsViewModel getInstance(BuildContext context) => context.read();

  Future<void> getAllOrders() async {
    try {
      emit(const RecepitsLoadingState());
      final orders = await repo.getAllOrder();
      allOrders.addAll(orders);
      emit(const RecepitsSuccessState());
    } catch (error) {
      if (error is CustomException) {
        emit(RecepitsErrorState(error.message));
      }
    }
  }
}
