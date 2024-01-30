// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:uuid/uuid.dart';

import 'item_model.dart';

class ItemEntity {
  final String id;
  final String name;
  final String image;
  final int quantity;
  final String unitPrice;
  final String? unit;
  final double totalPrice;
  bool isFavorite;

  ItemEntity({
    required this.id,
    required this.name,
    required this.image,
    required this.quantity,
    required this.unitPrice,
    this.unit,
    required this.totalPrice,
    this.isFavorite = false,
  });

  factory ItemEntity.fromModel(Item item) {
    const uuid = Uuid();
    return ItemEntity(
      id: uuid.v1(),
      name: item.name,
      image: item.image,
      quantity: item.quantity,
      unitPrice: item.unitPrice,
      unit: item.unit,
      totalPrice: item.totalPrice,
      isFavorite: false,
    );
  }

  ItemEntity copyWith({
    String? id,
    String? name,
    String? image,
    int? quantity,
    String? unitPrice,
    String? unit,
    double? totalPrice,
    bool? isFavorite,
  }) {
    return ItemEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      quantity: quantity ?? this.quantity,
      unitPrice: unitPrice ?? this.unitPrice,
      unit: unit ?? this.unit,
      totalPrice: totalPrice ?? this.totalPrice,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'image': image,
      'quantity': quantity,
      'unitPrice': unitPrice,
      'unit': unit,
      'totalPrice': totalPrice,
      'isFavorite': isFavorite,
    };
  }

  factory ItemEntity.fromMap(Map<String, dynamic> map) {
    return ItemEntity(
      id: map['id'] as String,
      name: map['name'] as String,
      image: map['image'] as String,
      quantity: map['quantity'] as int,
      unitPrice: map['unitPrice'] as String,
      unit: map['unit'] != null ? map['unit'] as String : null,
      totalPrice: map['totalPrice'] as double,
      isFavorite: map['isFavorite'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory ItemEntity.fromJson(String source) => ItemEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ItemEntity(id: $id, name: $name, image: $image, quantity: $quantity, unitPrice: $unitPrice, unit: $unit, totalPrice: $totalPrice, isFavorite: $isFavorite)';
  }

  @override
  bool operator ==(covariant ItemEntity other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.image == image &&
      other.quantity == quantity &&
      other.unitPrice == unitPrice &&
      other.unit == unit &&
      other.totalPrice == totalPrice &&
      other.isFavorite == isFavorite;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      image.hashCode ^
      quantity.hashCode ^
      unitPrice.hashCode ^
      unit.hashCode ^
      totalPrice.hashCode ^
      isFavorite.hashCode;
  }
}
