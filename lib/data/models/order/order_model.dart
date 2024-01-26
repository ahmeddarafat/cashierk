import 'package:start_app/data/data_source/remote/api_constants.dart';

import '../../../resources/localization/generated/l10n.dart';

class OrderModel {
  final String id;
  final String status;
  final String totalPrice;
  final String shopName;
  final DateTime date;
  final String notes;
  final double subTotalPrice;
  final double taxes;
  final List<OrderItem> items;

  OrderModel({
    required this.shopName,
    required this.date,
    required this.notes,
    required this.subTotalPrice,
    required this.taxes,
    required this.id,
    required this.status,
    required this.totalPrice,
    required this.items,
  });

  /// TODO: data - compelte the rest of the fields
  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      id: map[ApiConstants.orderNumber] as String,
      status: map[ApiConstants.orderStatus] as String,
      totalPrice: map[ApiConstants.orderTotal] as String,
      items: (map[ApiConstants.orderItems] as List)
          .map((item) => OrderItem.fromMap(item))
          .toList(),
      shopName: '',
      date: DateTime.now(),
      notes: '',
      subTotalPrice: 0,
      taxes: 0,
    );
  }
}

class OrderItem {
  final String name;
  final String image;
  final int quantity;
  final String unitPrice;
  late final double totalPrice;

  OrderItem({
    required this.name,
    required this.image,
    required this.quantity,
    required this.unitPrice,
  }) {
    totalPrice = quantity * double.parse(unitPrice);
  }

  factory OrderItem.fromMap(Map<String, dynamic> map) {
    return OrderItem(
      name: map[ApiConstants.productName] as String,
      image: map[ApiConstants.productImage] as String,
      quantity: map[ApiConstants.quantity] as int,
      unitPrice: map[ApiConstants.unitPrice] as String,
    );
  }
}
