import 'package:home_dreams/core/entities/product_entity.dart';

ProductEntity getDummyProduct() {
  return ProductEntity(
    name: 'Apple',
    description: 'Description',
    code: 'Code',
    price: 10,
    isFeatured: true,
    imageUrl: null,
    numberOfCalories: 10,
    unitAmount: 10,
    expirationMonths: 10,
    isOrganic: true,
    reviews: [],
    avgRating: 10,
    ratingCount: 10,
    sellingCount: 10,
  );
}

List<ProductEntity> getDummyProducts() {
  return List.generate(10, (index) => getDummyProduct());
}
