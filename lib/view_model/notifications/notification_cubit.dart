import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import '../../data/data_source/remote/firebase_service.dart';
import '../../data/models/notification_model.dart';

import '../../resources/helper/navigation_service.dart';

part 'notification_state.dart';

/// It must be a top-level function to be called from the background message handler
Future<void> handleBackGroundMessage(RemoteMessage message) async {
  final context = NavigationService.navigatorKey.currentContext;
  if (context != null) {
    final notificationCubit = context.read<NotificationCubit>();
    notificationCubit.handleMessage(message);
  log("notification: inside of the context");
  } else {
    log("notificaotin: context is null");
  }

}

class NotificationCubit extends Cubit<NotificationState> with HydratedMixin {
  late List<NotificationModel> notifications;
  late FirebaseService firebaseService;
  NotificationCubit() : super(NotificationInitial()) {
    notifications = [];
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
      date: message.sentTime ?? DateTime.now(),
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
