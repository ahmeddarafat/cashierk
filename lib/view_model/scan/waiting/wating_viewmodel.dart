import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:start_app/data/data_source/local/app_prefs.dart';
import 'package:start_app/data/models/order_entity.dart';
import 'package:start_app/data/network/custom_exception.dart';
import 'package:start_app/view_model/scan/waiting/wating_state.dart';

import '../../../data/repository/scan_repository.dart';
import '../../../resources/service_locator/service_locator.dart';

enum OrderStatus { pending, processing, complete }

extension OrderStatusX on OrderStatus {
  String get name {
    return switch (this) {
      OrderStatus.pending => "pending",
      OrderStatus.processing => "processing",
      OrderStatus.complete => "complete",
    };
  }
}

class WaitingViewModel extends Cubit<WaitingState> {
  final ScanRepository repo;
  late final AppPrefs _appPrefs;
  late final OrderEntity order;

  WaitingViewModel(this.repo) : super(const WaitingLoadingState()) {
    _appPrefs = getIt<AppPrefs>();
  }

  static WaitingViewModel getInstance(BuildContext context) => context.read();

  // TODO: data - prefer move the data actions to the repository (re-requests)
  Future<void> getOrderItems() async {
    final orderNumber = _appPrefs.getOrderNumber();
    try {
      var order = await repo.getOrderItems(orderNumber);
      while (order.status == OrderStatus.pending.name) {
        order = await repo.getOrderItems(orderNumber);
        await Future.delayed(const Duration(milliseconds: 500));
      }
      this.order = OrderEntity.fromModel(order);
      emit(const WaitingCompleteState());
    } catch (error) {
      if (error is CustomException) {
        emit(WaitingErrorState(error.message));
      }
    }
  }
}
