import 'package:intl/intl.dart';
import 'package:start_app/resources/extensions/app_extensions.dart';

import 'item_model.dart';
import 'order_model.dart';

enum OrderStatus { pending, processing, delivered, canceled }

extension OrderStatusExtension on OrderStatus {
  String get name {
    switch (this) {
      case OrderStatus.pending:
        return "Pending";
      case OrderStatus.delivered:
        return "Delivered";
      case OrderStatus.canceled:
        return "Canceled";
      case OrderStatus.processing:
        return "Processing";
    }
  }
}

class OrderEntity {
  final String id;
  final String shopName;
  final OrderStatus status;
  final String notes;
  final String date;
  final String time;
  final double taxes;
  final double subTotalPrice;
  final double totalPrice;
  final List<Item> items;

  OrderEntity({
    required this.shopName,
    required this.date,
    required this.notes,
    required this.subTotalPrice,
    required this.taxes,
    required this.id,
    required this.status,
    required this.totalPrice,
    required this.items,
    required this.time,
  });

  factory OrderEntity.fromModel(Order order) {
    final parseDate = DateFormat("yyyy-MM-dd HH:mm:ss").parse(order.date);
    final subTotalPrice = double.parse(order.subTotalPrice);
    final totalPrice = double.parse(order.totalPrice);
    late final OrderStatus orderStatus;
    switch (order.status) {
      case "pending":
        orderStatus = OrderStatus.pending;
        break;
      case "processing":
        orderStatus = OrderStatus.processing;
        break;
      case "canceled":
        orderStatus = OrderStatus.canceled;
        break;
      case "completed":
        orderStatus = OrderStatus.delivered;
        break;
    }

    return OrderEntity(
      id: order.id,
      shopName: order.shopName,
      notes: order.notes,
      date: parseDate.monthDayYearFormat,
      time: parseDate.timeFormat,
      subTotalPrice: subTotalPrice,
      taxes: order.taxes,
      totalPrice: totalPrice,
      items: order.items,
      status: orderStatus,
    );
  }
}
