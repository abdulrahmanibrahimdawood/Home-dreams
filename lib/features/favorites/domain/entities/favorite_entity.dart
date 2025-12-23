import 'package:equatable/equatable.dart';
import 'package:home_dreams/core/entities/product_entity.dart';

class FavoriteEntity extends Equatable {
  final List<ProductEntity> favoritesList;

  const FavoriteEntity(this.favoritesList);
  addFavoriteItem(ProductEntity productEntity) {
    favoritesList.add(productEntity);
  }

  removeFavoriteItem(ProductEntity productEntity) {
    favoritesList.remove(productEntity);
  }

  bool isExist(ProductEntity productEntity) {
    for (var favoriteItem in favoritesList) {
      if (favoriteItem == productEntity) {
        return true;
      }
    }
    return false;
  }

  @override
  List<Object?> get props => [];
}
