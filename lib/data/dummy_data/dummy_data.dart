import 'package:start_app/data/models/local/recepits/order_model.dart';

import '../../resources/constants/app_assets.dart';
import '../models/local/cart/cart_item.dart';
import '../models/local/categories/item_model.dart';
import '../models/local/notifications/notification_model.dart';

class DummyData {
  DummyData._();

  static final items = [
    Item(
      image: Assets.imagesOrange,
      name: "Orange",
      amount: "1 Kg",
      price: 20,
    ),
    Item(
      image: Assets.imagesMeat,
      name: "Meat",
      amount: "1 Kg",
      price: 100,
    ),
    Item(
      image: Assets.imagesAvacado,
      name: "Avacado",
      amount: "1 Kg",
      price: 35.5,
    ),
    Item(
      image: Assets.imagesBrokly,
      name: "broccoli",
      amount: "1 Kg",
      price: 10.8,
    ),
    Item(
      image: Assets.imagesOrange,
      name: "Orange",
      amount: "1 Kg",
      price: 20,
    ),
    Item(
      image: Assets.imagesMeat,
      name: "Meat",
      amount: "1 Kg",
      price: 100,
    ),
    Item(
      image: Assets.imagesAvacado,
      name: "Avacado",
      amount: "1 Kg",
      price: 35.5,
    ),
    Item(
      image: Assets.imagesBrokly,
      name: "broccoli",
      amount: "1 Kg",
      price: 10.8,
    ),
  ];

  static const List<NotificationObject> notifications = [
    NotificationObject(
      title: "Fresh Vegetables",
      date: "Aug 12, 2023",
      content: "30% - 50% Off on selected vegetables",
    ),
    NotificationObject(
      title: "Fresh Fruits",
      date: "Mar 15, 2023",
      content: "30% - 50% Off on selected fruits.",
    ),
    NotificationObject(
      title: "Fresh Vegetables",
      date: "Aug 12, 2023",
      content: "30% - 50% Off on selected vegetables",
    ),
    NotificationObject(
      title: "Fresh Fruits",
      date: "Mar 15, 2023",
      content: "30% - 50% Off on selected fruits.",
    ),
    NotificationObject(
      title: "Fresh Vegetables",
      date: "Aug 12, 2023",
      content: "30% - 50% Off on selected vegetables",
    ),
    NotificationObject(
      title: "Fresh Fruits",
      date: "Mar 15, 2023",
      content: "30% - 50% Off on selected fruits.",
    ),
  ];

  static final cartItems = [
    CartItem(
      image: Assets.imagesOrange,
      name: "Orange",
      amount: "3 Kg",
      price: "\$7.00/kg",
      totalPrice: 21,
    ),
    CartItem(
      image: Assets.imagesMeat,
      name: "Meat",
      amount: "1 Kg",
      price: "\$100.00/kg",
      totalPrice: 100,
    ),
    CartItem(
      image: Assets.imagesAvacado,
      name: "Avacado",
      amount: "2 Kg",
      price: "\$35.5/kg",
      totalPrice: 71,
    ),
    CartItem(
      image: Assets.imagesBrokly,
      name: "broccoli",
      amount: "3 Kg",
      price: "\$10.00/kg",
      totalPrice: 30,
    ),
    CartItem(
      image: Assets.imagesOrange,
      name: "Orange",
      amount: "3 Kg",
      price: "\$7.00/kg",
      totalPrice: 21,
    ),
    CartItem(
      image: Assets.imagesMeat,
      name: "Meat",
      amount: "1 Kg",
      price: "\$100.00/kg",
      totalPrice: 100,
    ),
    CartItem(
      image: Assets.imagesAvacado,
      name: "Avacado",
      amount: "2 Kg",
      price: "\$35.5/kg",
      totalPrice: 71,
    ),
    CartItem(
      image: Assets.imagesBrokly,
      name: "broccoli",
      amount: "3 Kg",
      price: "\$10.00/kg",
      totalPrice: 30,
    ),
  ];

  static final orders = [
    Order(
      shopName: "carrefour",
      date: DateTime.now(),
      status: OrderStatus.complete,
      notes:
          "Please check the product before packaging, and check the product before packaging.",
      subTotalPrice: 8.5,
      taxes: 0.5,
    ),
    Order(
      shopName: "carrefour",
      date: DateTime.now(),
      status: OrderStatus.cancel,
      notes:
          "Please check the product before packaging, and check the product before packaging.",
      subTotalPrice: 20.5,
      taxes: 0.5,
    ),
  ];
}
