import 'package:home_dreams/features/home/domain/entites/cart_item_entity.dart';

import 'item.payment.entity.dart';

class ItemList {
  List<Item>? items;

  ItemList({this.items});

  Map<String, dynamic> toJson() => {
    'items': items?.map((e) => e.toJson()).toList(),
  };

  factory ItemList.fromEntity(List<CartItemEntity> items) =>
      ItemList(items: items.map((e) => Item.fromEntity(e)).toList());
}
