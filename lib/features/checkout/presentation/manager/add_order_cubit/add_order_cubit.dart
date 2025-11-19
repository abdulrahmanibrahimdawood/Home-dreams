import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show Cubit;
import 'package:home_dreams/core/repos/order_repo/order_repo.dart';
import 'package:home_dreams/features/checkout/domain/entites/order_input_entity.dart';

part 'add_order_state.dart';

class AddOrderCubit extends Cubit<AddOrderState> {
  AddOrderCubit(this.orderRepo) : super(AddOrderInitial());
  final OrderRepo orderRepo;
  void addOrder({required OrderInputEntity order}) async {
    emit(AddOrderLoading());
    var result = await orderRepo.createOrder(order: order);
    result.fold(
      (failure) => emit(AddOrderFailure(errMessage: failure.message)),
      (success) => emit(AddOrderSuccess()),
    );
  }
}
