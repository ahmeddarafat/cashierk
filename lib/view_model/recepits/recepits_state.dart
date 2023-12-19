part of 'recepits_viewmodel.dart';

sealed class RecepitsState extends Equatable {
  const RecepitsState();

  @override
  List<Object> get props => [];
}

final class RecepitsInitState extends RecepitsState {
  const RecepitsInitState();
}

final class RecepitsSuccessState extends RecepitsState {
  const RecepitsSuccessState();
}

final class RecepitsLoadingState extends RecepitsState {
  const RecepitsLoadingState();
}

final class RecepitsErrorState extends RecepitsState {
  final String message;

  const RecepitsErrorState(this.message);

  @override
  List<Object> get props => [];
}
