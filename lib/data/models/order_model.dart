import 'package:start_app/data/data_source/remote/api_constants.dart';
import 'package:start_app/data/models/item_model.dart';

class Order {
  final String id;
  final String status;
  final String totalPrice;
  final String shopName;
  final DateTime date;
  final String notes;
  final double subTotalPrice;
  final double taxes;
  final List<Item> items;

  Order({
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
  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      id: map[ApiConstants.orderNumber] as String,
      status: map[ApiConstants.orderStatus] as String,
      totalPrice: map[ApiConstants.orderTotal] as String,
      items: (map[ApiConstants.orderItems] as List)
          .map((item) => Item.fromMap(item))
          .toList(),
      shopName: '',
      date: DateTime.now(),
      notes: '',
      subTotalPrice: 0,
      taxes: 0,
    );
  }
}
