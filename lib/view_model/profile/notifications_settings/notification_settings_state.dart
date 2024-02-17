part of 'notification_settings_cubit.dart';

class NotificationSettingsState extends Equatable {
  const NotificationSettingsState();
  @override
  List<Object> get props => [];
}

class NotificationSettingsInitial extends NotificationSettingsState {
  const NotificationSettingsInitial();
}

class NotificationSettingsStateChange extends NotificationSettingsState {
  final List<bool> notifications;
  const NotificationSettingsStateChange(
    this.notifications,
  );

  @override
  List<Object> get props => [notifications];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'notifications': notifications,
    };
  }

  factory NotificationSettingsStateChange.fromMap(Map<String, dynamic> map) {
    return NotificationSettingsStateChange(
      List<bool>.from(
        (map['notifications'] as List<bool>),
      ),
    );
  }
}
