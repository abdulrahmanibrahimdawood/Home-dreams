import 'package:home_dreams/features/checkout/domain/entites/order_input_entity.dart';

class DetailsEntity {
  String? subtotal;
  String? shipping;
  double? shippingDiscount;

  DetailsEntity({this.subtotal, this.shipping, this.shippingDiscount});

  toJson() => {
    'subtotal': subtotal,
    'shipping': shipping,
    'shipping_discount': shippingDiscount,
  };
  factory DetailsEntity.fromJson(OrderInputEntity order) => DetailsEntity(
    subtotal: order.cartEntity.calculateTotalPrice().toString(),
    shipping: order.calculateShippingCost().toString(),
    shippingDiscount: order.calculateShippingDiscount(),
  );
}
