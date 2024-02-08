part of 'notification_cubit.dart';

sealed class NotificationState extends Equatable {
  const NotificationState();

  @override
  List<Object> get props => [];
}

final class NotificationInitial extends NotificationState {}

class NotificationReceived extends NotificationState {
  final String title;
  final String body;
  final DateTime date;
  final Map<String, dynamic>? data;

  const NotificationReceived({
    required this.title,
    required this.body,
    required this.date,
    this.data,
  });

  @override
  List<Object> get props => [date];

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'title': title,
      'body': body,
      'date': date.millisecondsSinceEpoch,
      'data': data,
    };
  }

  factory NotificationReceived.fromMap(Map<String, dynamic> map) {
    return NotificationReceived(
      title: map['title'] as String,
      body: map['body'] as String,
      date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
      data: map['data'] as Map<String, dynamic>?,
    );
  }
}
