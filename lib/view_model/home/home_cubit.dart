import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:start_app/data/dummy_data/dummy_data.dart';
import 'package:start_app/data/models/item_entity.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  late List<ItemEntity> allItems;
  late List<ItemEntity> favoirteItems;
  HomeCubit() : super(HomeInitial()) {
    /// beacuse we don't have a real api
    /// we will convert the models to entities here not in repository
    allItems =
        DummyData.items.map((item) => ItemEntity.fromModel(item)).toList();
    favoirteItems = [];
  }

  static HomeCubit getInstance(BuildContext context) => context.read();

  void changeFavorite(String id) {
    for (int i = 0; i < allItems.length; i++) {
      var item = allItems[i];
      if (item.id == id) {
        _modifyFavoriteList(item, id);
        item.isFavorite = !item.isFavorite;
        emit(ChangeFavoriteState(id: id, isFavorite: item.isFavorite));
        break;
      }
    }
  }

  void _modifyFavoriteList(ItemEntity item, String id) {
    if (item.isFavorite) {
      favoirteItems.removeWhere((item) => item.id == id);
    } else {
      favoirteItems.add(item);
    }
  }
}
