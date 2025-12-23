import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show Cubit;
import 'package:home_dreams/core/entities/product_entity.dart';
import 'package:home_dreams/features/favorites/domain/entities/favorite_entity.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteInitial());
  FavoriteEntity favoriteEntity = FavoriteEntity([]);
  void addFavoriteProduct(ProductEntity productEntity) {
    bool isProductExist = favoriteEntity.isExist(productEntity);
    if (!isProductExist) {
      favoriteEntity.addFavoriteItem(productEntity);
      emit(FavoriteItemAdded());
    }
  }

  void deleteFavoriteProduct(ProductEntity productEntity) {
    favoriteEntity.removeFavoriteItem(productEntity);
    emit(FavoriteItemRemoved());
  }
}
