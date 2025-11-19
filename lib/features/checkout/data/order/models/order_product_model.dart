import 'package:home_dreams/features/home/domain/entites/cart_item_entity.dart';

class OrderProductModel {
  final String code;
  final String name;
  final String imageUrl;
  final int quantity;
  final double price;

  OrderProductModel({
    required this.code,
    required this.name,
    required this.imageUrl,
    required this.quantity,
    required this.price,
  });
  factory OrderProductModel.fromEntity({
    required CartItemEntity cartItemEntity,
  }) {
    return OrderProductModel(
      code: cartItemEntity.productEntity.code,
      name: cartItemEntity.productEntity.name,
      imageUrl: cartItemEntity.productEntity.imageUrl!,
      quantity: cartItemEntity.quantity,
      price: cartItemEntity.productEntity.price.toDouble(),
    );
  }
  toJson() {
    return {
      'code': code,
      'name': name,
      'imageUrl': imageUrl,
      'quantity': quantity,
      'price': price,
    };
  }
}
