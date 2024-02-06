import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:start_app/data/dummy_data/dummy_data.dart';
import 'package:start_app/data/models/item_entity.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> with HydratedMixin {
  late List<ItemEntity> allItems;
  late List<ItemEntity> favoirteItems;
  late List<ItemEntity> filteredItems;

  HomeCubit() : super(HomeInitial()) {
    /// beacuse we don't have a real api
    /// we will convert the models to entities here not in repository
    allItems =
        DummyData.items.map((item) => ItemEntity.fromModel(item)).toList();
    favoirteItems = [];
    filteredItems = allItems;
    hydrate();
  }

  static HomeCubit getInstance(BuildContext context) => context.read();

  @override
  HomeState? fromJson(Map<String, dynamic> json) {
    var state = FavoriteItemsState.fromJson(json);
    _cachingData(state);
    return state;
  }

  @override
  Map<String, dynamic>? toJson(HomeState state) {
    if (state is FavoriteItemsState) {
      return state.toJson();
    }
    return null;
  }

  void changeFavorite(String id) {
    for (int i = 0; i < allItems.length; i++) {
      var item = allItems[i];
      if (item.id == id) {
        _modifyFavoriteList(item, id);
        item.isFavorite = !item.isFavorite;
        emit(ChangeFavoriteState(id: id, isFavorite: item.isFavorite));
        emit(FavoriteItemsState(favoirteItems));
        break;
      }
    }
  }

  void filterItemsByLabel(String label) {
    filteredItems = allItems.where((item) {
      return item.category.toLowerCase() == label.toLowerCase();
    }).toList();
    emit(FilterItemsState(label));
  }

  void filterItemsBySearch(String str) {
    filteredItems = allItems.where((item) {
      return item.name.toLowerCase().contains(str.toLowerCase());
    }).toList();
    emit(FilterItemsState(str));
  }

  void removeFilter() {
    filteredItems = allItems;
    emit(const FilterItemsState('no filter'));
  }

  void _modifyFavoriteList(ItemEntity item, String id) {
    if (item.isFavorite) {
      favoirteItems.removeWhere((item) => item.id == id);
    } else {
      favoirteItems.add(item);
    }
  }

  void _cachingData(FavoriteItemsState state) {
    favoirteItems.addAll(state.items);
    // TODO: logic - bad algorithm need to be improved
    for (var item in allItems) {
      for (var favItem in favoirteItems) {
        if (item.id == favItem.id) {
          item.isFavorite = true;
        }
      }
    }
  }
}

