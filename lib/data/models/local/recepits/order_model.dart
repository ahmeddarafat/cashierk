import '../../../../resources/localization/generated/l10n.dart';

enum OrderStatus {
  complete,
  cancel,
}

extension Naming on OrderStatus {
  String get name {
    return switch (this) {
      OrderStatus.complete => S.current.completed,
      OrderStatus.cancel => S.current.canceled,
    };
  }
}

class Order {
  final String shopName;
  final DateTime date;
  final OrderStatus status;
  final String notes;
  final double subTotalPrice;
  final double taxes;
  final double totalPrice;

  Order({
    required this.shopName,
    required this.date,
    required this.status,
    required this.notes,
    required this.subTotalPrice,
    required this.taxes,
  }) : totalPrice = subTotalPrice + taxes;
}
