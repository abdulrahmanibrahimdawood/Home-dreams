import 'package:home_dreams/features/checkout/data/order/models/order_product_model.dart';
import 'package:home_dreams/features/checkout/data/order/models/shipping_address_model.dart';
import 'package:home_dreams/features/checkout/domain/entites/order_input_entity.dart';
import 'package:uuid/uuid.dart';

class OrderModel {
  final double totalPrice;
  final String uId;
  final ShippingAddressModel shippingAddressModel;
  final List<OrderProductModel> orderProducts;
  final String paymentMethod;
  final String orderId;

  OrderModel({
    required this.orderId,
    required this.totalPrice,
    required this.uId,
    required this.shippingAddressModel,
    required this.orderProducts,
    required this.paymentMethod,
  });
  factory OrderModel.fromEntity(OrderInputEntity orderEntity) => OrderModel(
    orderId: Uuid().v4(),
    totalPrice: orderEntity.cartEntity.calculateTotalPrice(),
    uId: orderEntity.uId,
    shippingAddressModel: ShippingAddressModel.fromEntity(
      orderEntity.shippingAddressEntity,
    ),
    orderProducts: orderEntity.cartEntity.cartItems
        .map((e) => OrderProductModel.fromEntity(cartItemEntity: e))
        .toList(),
    paymentMethod: orderEntity.payWithCash! ? 'Cash' : 'PayPal',
  );
  toJson() {
    return {
      'orderId': orderId,
      'totalPrice': totalPrice,
      'uId': uId,
      'status': 'pending',
      'date': DateTime.now().toString(),
      'shippingAddressEntity': shippingAddressModel.toJson(),
      'orderProducts': orderProducts.map((e) => e.toJson()).toList(),
      'paymentMethod': paymentMethod,
    };
  }
}
