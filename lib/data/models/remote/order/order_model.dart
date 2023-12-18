import 'package:start_app/data/data_source/remote/api_constants.dart';

class OrderModel {
  final String number;
  final String status;
  final String totalPrice;
  final List<OrderItem> items;

  OrderModel({
    required this.number,
    required this.status,
    required this.totalPrice,
    required this.items,
  });

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      number: map[ApiVars.orderNumber] as String,
      status: map[ApiVars.orderStatus] as String,
      totalPrice: map[ApiVars.orderTotal] as String,
      items: (map[ApiVars.orderItems] as List)
          .map((item) => OrderItem.fromMap(item))
          .toList(),
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
  }){
    totalPrice = quantity * double.parse(unitPrice);
  }

  factory OrderItem.fromMap(Map<String, dynamic> map) {
    return OrderItem(
      name: map[ApiVars.productName] as String,
      image: map[ApiVars.productImage] as String,
      quantity: map[ApiVars.quantity] as int,
      unitPrice: map[ApiVars.unitPrice] as String,
    );
  }
}
