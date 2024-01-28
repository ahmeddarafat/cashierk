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
}
