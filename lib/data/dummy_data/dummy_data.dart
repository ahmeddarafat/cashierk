import '../../resources/constants/app_assets.dart';
import '../models/item_model.dart';
import '../models/notification_model.dart';

class DummyData {
  DummyData._();

  static final items = [
    Item(
      id: "1",
      image: Assets.imagesOrange,
      name: "Orange",
      unit: "Kg",
      quantity: 1,
      unitPrice: '20',
      category: 'Fruits',
    ),
    Item(
      id: "2",
      image: Assets.imagesMeat,
      name: "Meat",
      unit: "Kg",
      unitPrice: "100",
      quantity: 1,
      category: 'Meat',
    ),
    Item(
      id: "3",
      image: Assets.imagesAvacado,
      name: "Avacado",
      unit: "Kg",
      unitPrice: "35.5",
      quantity: 1,
      category: 'Fruits',
    ),
    Item(
      id: "4",
      image: Assets.imagesBrokly,
      name: "broccoli",
      unit: "Kg",
      quantity: 1,
      unitPrice: "10.8",
      category: 'Vegetables',
    ),
    Item(
      id: "5",
      image: Assets.imagesOrange,
      name: "Orange",
      unit: "Kg",
      quantity: 1,
      unitPrice: '20',
      category: 'Fruits',
    ),
    Item(
      id: "6",
      image: Assets.imagesMeat,
      name: "Meat",
      unit: "Kg",
      unitPrice: "100",
      quantity: 1,
      category: 'Meat',
    ),
    Item(
      id: "7",
      image: Assets.imagesAvacado,
      name: "Avacado",
      unit: "Kg",
      unitPrice: "35.5",
      quantity: 1,
      category: 'Fruits',
    ),
    Item(
      id: "8",
      image: Assets.imagesBrokly,
      name: "broccoli",
      unit: "Kg",
      quantity: 1,
      unitPrice: "10.8",
      category: 'Vegetables',
    ),
  ];

  static  List<NotificationModel> notifications = [
    NotificationModel(
      title: "Fresh Vegetables",
      date: DateTime.now(),
      body: "30% - 50% Off on selected vegetables",
    ),
    NotificationModel(
      title: "Fresh Fruits",
      body: "30% - 50% Off on selected fruits.",
      date: DateTime.now(),
    ),
    NotificationModel(
      title: "Fresh Vegetables",
      body: "30% - 50% Off on selected vegetables",
      date: DateTime.now(),
    ),
    NotificationModel(
      title: "Fresh Fruits",
      body: "30% - 50% Off on selected fruits.",
      date: DateTime.now(),
    ),
    NotificationModel(
      title: "Fresh Vegetables",
      body: "30% - 50% Off on selected vegetables",
      date: DateTime.now(),
    ),
    NotificationModel(
      title: "Fresh Fruits",
      body: "30% - 50% Off on selected fruits.",
      date: DateTime.now(),
    ),
  ];

  // static final orders = [
  //   Order(
  //     shopName: "Carrefour",
  //     date: DateTime.now(),
  //     status: "completed",
  //     notes:
  //         "Please check the product before packaging, and check the product before packaging.",
  //     subTotalPrice: 8.5,
  //     taxes: 0.5,
  //     totalPrice: '9',
  //     id: '',
  //     items: [...items],
  //   ),
  //   Order(
  //     shopName: "Carrefour",
  //     date: DateTime.now(),
  //     status: "canceled",
  //     notes:
  //         "Please check the product before packaging, and check the product before packaging.",
  //     subTotalPrice: 20.5,
  //     taxes: 0.5,
  //     totalPrice: '21',
  //     id: '',
  //     items: [...items],
  //   ),
  // ];
}
