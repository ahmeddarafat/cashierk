part of 'home_cubit.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}

final class ChangeFavoriteState extends HomeState {
  final String id;
  final bool isFavorite;

  const ChangeFavoriteState({required this.id, required this.isFavorite});

  @override
  List<Object> get props => [id,isFavorite];
}
