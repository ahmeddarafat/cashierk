class NotificationModel {
  final String title;
  final String body;
  final DateTime date;
  final Map<String, dynamic>? data;

  const NotificationModel({
    required this.title,
    required this.date,
    required this.body,
    this.data,
  });

  @override
  String toString() {
    return 'NotificationModel(title: $title, body: $body, date: $date, data: $data)';
  }
}
