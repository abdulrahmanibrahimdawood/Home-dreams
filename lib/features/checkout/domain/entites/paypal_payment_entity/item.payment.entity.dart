import 'package:home_dreams/core/helper_funcations/get_currency.dart';
import 'package:home_dreams/features/home/domain/entites/cart_item_entity.dart';

class Item {
  String? name;
  int? quantity;
  String? price;
  String? currency;

  Item({this.name, this.quantity, this.price, this.currency});

  Map<String, dynamic> toJson() => {
    'name': name,
    'quantity': quantity,
    'price': price,
    'currency': currency,
  };
  factory Item.fromEntity(CartItemEntity cartItem) => Item(
    name: cartItem.productEntity.name,
    quantity: cartItem.quantity,
    price: cartItem.productEntity.price.toString(),
    currency: getCurrency(),
  );
}
