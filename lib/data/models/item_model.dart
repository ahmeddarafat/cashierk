import 'dart:convert';

import '../data_source/remote/api_constants.dart';

class Item {
  final String id;
  final String name;
  final String image;
  final int quantity;
  final String unitPrice;
  final String? unit;
  final String category;
  late final double totalPrice;

  Item({
    required this.id,
    required this.name,
    required this.image,
    required this.quantity,
    required this.unitPrice,
    required this.category,
    this.unit,
  }) {
    totalPrice = quantity * double.parse(unitPrice);
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map[ApiConstants.productId] as String? ?? "0",
      name: map[ApiConstants.productName] as String,
      image: map[ApiConstants.productImage] as String,
      quantity: map[ApiConstants.quantity] as int,
      unitPrice: map[ApiConstants.unitPrice] as String,
      category: map[ApiConstants.category] as String? ?? "unknown",
      unit: map[ApiConstants.productUnit] as String? ??"",
    );
  }
}
