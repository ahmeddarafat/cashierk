import 'dart:convert';
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import '../../data/models/order_entity.dart';
import '../../data/repository/recepits_repository.dart';

import '../../data/network/custom_exception.dart';

part 'recepits_state.dart';

class RecepitsViewModel extends Cubit<RecepitsState> with HydratedMixin {
  final RecepitsRepository repo;
  late List<OrderEntity> allOrders;

  RecepitsViewModel(this.repo) : super(const RecepitsInitState()) {
    allOrders = [];
    hydrate();
  }

  static RecepitsViewModel getInstance(BuildContext context) => context.read();

  @override
  RecepitsState? fromJson(Map<String, dynamic> json) {
    return RecepitsSuccessState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(RecepitsState state) {
    if (state is RecepitsSuccessState) {
      return state.toMap();
    }
    return null;
  }

  Future<void> getAllOrders() async {
    final currentState = state;
    if (currentState is RecepitsSuccessState &&
        !currentState.expiredTime.isBefore(DateTime.now())) {
      emit(state);
      return;
    } else {
      await _getOrdersRequest();
    }
  }

  Future<void> _getOrdersRequest() async {
    try {
      final expiredTime = DateTime.now().add(const Duration(minutes: 1));
      emit(const RecepitsLoadingState());
      final orders = await repo.getAllOrder();
      allOrders = orders;
      emit(
        RecepitsSuccessState(
          orders: orders,
          expiredTime: expiredTime,
        ),
      );
    } catch (error) {
      log(error.toString());
      if (error is CustomException) {
        log(error.message);
        emit(RecepitsErrorState(error.message));
      }
    }
  }
}
