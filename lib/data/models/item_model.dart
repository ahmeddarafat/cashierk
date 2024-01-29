import 'dart:convert';

import '../data_source/remote/api_constants.dart';

class Item {
  final String name;
  final String image;
  final int quantity;
  final String unitPrice;
  final String unit;
  late final double totalPrice;

  Item({
    required this.name,
    required this.image,
    required this.quantity,
    required this.unitPrice,
    required this.unit,
  }) {
    totalPrice = quantity * double.parse(unitPrice);
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      name: map[ApiConstants.productName] as String,
      image: map[ApiConstants.productImage] as String,
      quantity: map[ApiConstants.quantity] as int,
      unitPrice: map[ApiConstants.unitPrice] as String,
      unit: '',
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'image': image,
      'quantity': quantity,
      'unitPrice': unitPrice,
      'unit': unit,
      'totalPrice': totalPrice
    };
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) =>
      Item.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Item(name: $name, image: $image, quantity: $quantity, unitPrice: $unitPrice, unit: $unit, totalPrice: $totalPrice)';
  }

  @override
  bool operator ==(covariant Item other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.image == image &&
        other.quantity == quantity &&
        other.unitPrice == unitPrice &&
        other.unit == unit &&
        other.totalPrice == totalPrice;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        image.hashCode ^
        quantity.hashCode ^
        unitPrice.hashCode ^
        unit.hashCode ^
        totalPrice.hashCode;
  }
}
