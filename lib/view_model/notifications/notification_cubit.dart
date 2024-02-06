import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:start_app/data/data_source/remote/firebase_service.dart';
import 'package:start_app/data/models/notification_model.dart';

part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> with HydratedMixin {
  late List<NotificationModel> notifications;
  late FirebaseService firebaseService;
  NotificationCubit() : super(NotificationInitial()) {
    notifications = [];
    firebaseService = FirebaseService();
    firebaseService.setMessageHandler(handleMessage);
    firebaseService.initPushNotification();
    hydrate();
  }

  @override
  NotificationState? fromJson(Map<String, dynamic> json) {
    return NotificationReceived.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(NotificationState state) {
    if (state is NotificationReceived) {
      return state.toJson();
    } else {
      return null;
    }
  }

  void handleMessage(RemoteMessage message) {
    final notification = NotificationModel(
      title: message.notification?.title ?? "Unkown",
      body: message.notification?.body ?? "Unkown",
      date: DateTime.now(),
      data: message.data,
    );

    _addNotification(notification);
  }

  void _addNotification(NotificationModel notification) {
    notifications.add(notification);
    emit(
      NotificationReceived(
        title: notification.title,
        body: notification.body,
        date: notification.date,
        data: notification.data,
      ),
    );
  }
}
