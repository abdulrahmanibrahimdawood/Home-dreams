import 'package:home_dreams/features/checkout/domain/entites/shipping_address_entity.dart';
import 'package:home_dreams/features/home/domain/entites/cart_entity.dart';

class OrderInputEntity {
  final String uId;
  final CartEntity cartEntity;
  bool? payWithCash;
  ShippingAddressEntity shippingAddressEntity;

  OrderInputEntity(
    this.cartEntity, {
    required this.shippingAddressEntity,
    this.payWithCash,
    required this.uId,
  });
  calculateShippingCost() {
    if (payWithCash!) {
      return 40;
    } else {
      return 0;
    }
  }

  double calculateShippingDiscount() {
    return 0;
  }

  calculateTotalPriceAfterDiscountAndShipping() {
    return cartEntity.calculateTotalPrice() +
        calculateShippingCost() -
        calculateShippingDiscount();
  }
}
