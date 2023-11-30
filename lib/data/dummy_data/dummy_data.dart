import '../../resources/constants/app_assets.dart';
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
}
