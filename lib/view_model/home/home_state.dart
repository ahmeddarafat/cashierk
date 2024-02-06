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
  List<Object> get props => [id, isFavorite];
}

final class FavoriteItemsState extends HomeState {
  final List<ItemEntity> items;

  const FavoriteItemsState(
    this.items,
  );

  @override
  List<Object> get props => [items];

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'items': items.map((x) => x.toMap()).toList(),
    };
  }

  factory FavoriteItemsState.fromJson(Map<String, dynamic> map) {
    return FavoriteItemsState(
      List<ItemEntity>.from(
        (map['items'] as List).map<ItemEntity>(
          (x) => ItemEntity.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }
}

final class FilterItemsState extends HomeState {
  final String label;

  const FilterItemsState(
    this.label,
  );

  @override
  List<Object> get props => [label];
}
