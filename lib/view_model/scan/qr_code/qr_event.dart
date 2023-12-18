import 'package:equatable/equatable.dart';

abstract class QREvent extends Equatable {
  const QREvent();

  @override
  List<Object?> get props => [];
}

class QRListeningEvent extends QREvent {
  final String code;
  const QRListeningEvent(this.code);
}
