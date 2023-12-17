import 'package:equatable/equatable.dart';

abstract class QREvent extends Equatable {
  const QREvent();

  @override
  List<Object?> get props => [];
}

class QRListeningEvent extends QREvent {
  const QRListeningEvent();

}
