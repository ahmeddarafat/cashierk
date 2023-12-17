import 'package:equatable/equatable.dart';

abstract class QRState extends Equatable {
  const QRState();

  @override
  List<Object?> get props => [];
}

class QRInitState extends QRState {
  const QRInitState();
}
class QRSuccessState extends QRState {
  const QRSuccessState();
}
class QRLoadingState extends QRState {
  const QRLoadingState();
}

class QRErrorState extends QRState {
  final String message;

  const QRErrorState(this.message);

  @override
  List<Object?> get props => [message];
}
