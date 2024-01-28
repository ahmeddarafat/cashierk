import '../../resources/constants/app_assets.dart';
import '../models/item_model.dart';
import '../models/notification_model.dart';
import '../models/order_model.dart';

class DummyData {
  DummyData._();

  static final items = [
    Item(
      image: Assets.imagesOrange,
      name: "Orange",
      unit: "Kg",
      quantity: 1,
      unitPrice: '20',
    ),
    Item(
      image: Assets.imagesMeat,
      name: "Meat",
      unit: "Kg",
      unitPrice: "100",
      quantity: 1,
    ),
    Item(
      image: Assets.imagesAvacado,
      name: "Avacado",
      unit: "Kg",
      unitPrice: "35.5",
      quantity: 1,
    ),
    Item(
      image: Assets.imagesBrokly,
      name: "broccoli",
      unit: "Kg",
      quantity: 1,
      unitPrice: "10.8",
    ),
    Item(
      image: Assets.imagesOrange,
      name: "Orange",
      unit: "Kg",
      quantity: 1,
      unitPrice: '20',
    ),
    Item(
      image: Assets.imagesMeat,
      name: "Meat",
      unit: "Kg",
      unitPrice: "100",
      quantity: 1,
    ),
    Item(
      image: Assets.imagesAvacado,
      name: "Avacado",
      unit: "Kg",
      unitPrice: "35.5",
      quantity: 1,
    ),
    Item(
      image: Assets.imagesBrokly,
      name: "broccoli",
      unit: "Kg",
      quantity: 1,
      unitPrice: "10.8",
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

  static final orders = [
    Order(
      shopName: "carrefour",
      date: DateTime.now(),
      status: "complete",
      notes:
          "Please check the product before packaging, and check the product before packaging.",
      subTotalPrice: 8.5,
      taxes: 0.5,
      totalPrice: '9',
      id: '',
      items: [],
    ),
    Order(
      shopName: "carrefour",
      date: DateTime.now(),
      status: "cancel",
      notes:
          "Please check the product before packaging, and check the product before packaging.",
      subTotalPrice: 20.5,
      taxes: 0.5,
      totalPrice: '21',
      id: '',
      items: [],
    ),
  ];
}
