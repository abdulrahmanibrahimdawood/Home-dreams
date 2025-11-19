import 'package:flutter_bloc/flutter_bloc.dart' show Cubit;
import 'package:home_dreams/features/home/domain/entites/cart_item_entity.dart';

part 'cart_item_state.dart';

class CartItemCubit extends Cubit<CartItemState> {
  CartItemCubit() : super(CartItemInitial());
  void updateCartItem(CartItemEntity cartItem) {
    emit(CartItemUpdateds(cartItemEntity: cartItem));
  }
}
