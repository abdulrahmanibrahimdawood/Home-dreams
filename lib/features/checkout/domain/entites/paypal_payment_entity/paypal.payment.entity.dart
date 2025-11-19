import 'package:home_dreams/features/checkout/domain/entites/order_input_entity.dart';

import 'amount.payment.entity.dart';
import 'item_list.payment.entity.dart';

class PaypalPaymentEntity {
  Amount? amount;
  String? description;
  ItemList? itemList;

  PaypalPaymentEntity({this.amount, this.description, this.itemList});

  factory PaypalPaymentEntity.fromEntity(OrderInputEntity entity) {
    return PaypalPaymentEntity(
      amount: Amount.fromEntity(entity),
      description: 'Payment Description',
      itemList: ItemList.fromEntity(entity.cartEntity.cartItems),
    );
  }
  toJson() => {
    'amount': amount?.toJson(),
    'description': description,
    'item_list': itemList?.toJson(),
  };
}
