import 'package:home_dreams/core/entities/product_entity.dart';

class FavoriteEntity {
  final List<ProductEntity> favoritesList;

  FavoriteEntity(this.favoritesList);
  addFavoriteItem(ProductEntity productEntity) {
    favoritesList.add(productEntity);
  }

  bool isExist(ProductEntity productEntity) {
    for (var favoriteItem in favoritesList) {
      if (favoriteItem == productEntity) {
        return true;
      }
    }
    return false;
  }
}
