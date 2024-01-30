// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:start_app/data/models/item_entity.dart';

import 'package:start_app/resources/extensions/app_extensions.dart';

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
  // enum
  final OrderStatus status;
  final String notes;
  final String date;
  final String time;
  final double taxes;
  final double subTotalPrice;
  final double totalPrice;
  final List<ItemEntity> items;

  OrderEntity({
    required this.id,
    required this.shopName,
    required this.status,
    required this.notes,
    required this.date,
    required this.time,
    required this.taxes,
    required this.subTotalPrice,
    required this.totalPrice,
    required this.items,
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
      items: order.items.map((item) => ItemEntity.fromModel(item)).toList(),
      status: orderStatus,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'shopName': shopName,
      'status': status.index,
      'notes': notes,
      'date': date,
      'time': time,
      'taxes': taxes,
      'subTotalPrice': subTotalPrice,
      'totalPrice': totalPrice,
      'items': items.map((x) => x.toMap()).toList(),
    };
  }

  factory OrderEntity.fromMap(Map<String, dynamic> map) {
    return OrderEntity(
      id: map['id'] as String,
      shopName: map['shopName'] as String,
      status: OrderStatus.values[map['status'] as int],
      notes: map['notes'] as String,
      date: map['date'] as String,
      time: map['time'] as String,
      taxes: map['taxes'] as double,
      subTotalPrice: map['subTotalPrice'] as double,
      totalPrice: map['totalPrice'] as double,
      items: List<ItemEntity>.from(
        (map['items'] as List<int>).map<ItemEntity>(
          (x) => ItemEntity.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderEntity.fromJson(String source) =>
      OrderEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'OrderEntity(id: $id, shopName: $shopName, status: $status, notes: $notes, date: $date, time: $time, taxes: $taxes, subTotalPrice: $subTotalPrice, totalPrice: $totalPrice, items: $items)';
  }
}
