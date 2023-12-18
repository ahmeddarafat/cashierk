import 'package:start_app/data/data_source/remote/api_constants.dart';

class OrderModel {
  final String orderNumber;
  final String orderStatus;
  final String orderTotal;
  final List<OrderItem> orderItems;

  OrderModel({
    required this.orderNumber,
    required this.orderStatus,
    required this.orderTotal,
    required this.orderItems,
  });

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      orderNumber: map[ApiVars.orderNumber] as String,
      orderStatus: map[ApiVars.orderStatus] as String,
      orderTotal: map[ApiVars.orderTotal] as String,
      orderItems: (map[ApiVars.orderItems] as List)
          .map((item) => OrderItem.fromMap(item))
          .toList(),
    );
  }
}

class OrderItem {
  final String productName;
  final String productImage;
  final int quantity;
  final String unitPrice;

  OrderItem({
    required this.productName,
    required this.productImage,
    required this.quantity,
    required this.unitPrice,
  });

  factory OrderItem.fromMap(Map<String, dynamic> map) {
    return OrderItem(
      productName: map[ApiVars.productName] as String,
      productImage: map[ApiVars.productImage] as String,
      quantity: map[ApiVars.quantity] as int,
      unitPrice: map[ApiVars.unitPrice] as String,
    );
  }
}
