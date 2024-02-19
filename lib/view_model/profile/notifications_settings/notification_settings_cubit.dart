import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import '../../../data/data_source/local/app_prefs.dart';
import '../../../resources/service_locator/service_locator.dart';

part 'notification_settings_state.dart';

class NotificationSettingsCubit extends Cubit<NotificationSettingsState>
    with HydratedMixin {
  late final List<bool> notifications;
  late final AppPrefs _appPrefs;
  NotificationSettingsCubit() : super(const NotificationSettingsInitial()) {
    _appPrefs = getIt();
    bool rememberMe = _appPrefs.isUserLoggedIn();
    notifications = [false, rememberMe, false, false, false, false];
    hydrate();
  }

  static NotificationSettingsCubit getInstance(BuildContext context) =>
      context.read();

  @override
  NotificationSettingsState? fromJson(Map<String, dynamic> json) {
    var state = NotificationSettingsStateChange.fromMap(json);
    notifications = state.notifications;
    return state;
  }

  @override
  Map<String, dynamic>? toJson(NotificationSettingsState state) {
    if (state is NotificationSettingsStateChange) {
      return state.toMap();
    } else {
      return null;
    }
  }

  void changeNotification(int index) {
    notifications[index] = !notifications[index];
    emit(NotificationSettingsStateChange(notifications));

    _setNotificationsSettings(index, notifications[index]);
  }

  void _setNotificationsSettings(int index, bool value) {
    // TODO: logic - set notification settings
    switch (index) {
      case 0:
        value ? _appPrefs.setNotificationOnOff() : null;
        break;
      case 1:
        value ? _appPrefs.isUserLoggedIn() : _appPrefs.logout();
        break;
      case 2:
        _appPrefs.setNotificationOnOff();
        break;
      case 3:
        break;
      case 4:
        break;
      case 5:
        break;
    }
  }
}
