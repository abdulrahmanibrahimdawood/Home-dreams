import 'package:dartz/dartz.dart';
import 'package:home_dreams/core/errors/failures.dart';
import 'package:home_dreams/core/repos/order_repo/order_repo.dart';
import 'package:home_dreams/core/services/data_service.dart';
import 'package:home_dreams/core/utils/backend_endpoints.dart';
import 'package:home_dreams/features/checkout/data/order/models/order_model.dart';
import 'package:home_dreams/features/checkout/domain/entites/order_input_entity.dart';

class OrderRepoImpl implements OrderRepo {
  final DatabaseServices firestoreServices;
  OrderRepoImpl({required this.firestoreServices});
  @override
  Future<Either<Failure, void>> createOrder({
    required OrderInputEntity order,
  }) async {
    try {
      var orderModel = OrderModel.fromEntity(order);
      await firestoreServices.addData(
        path: BackendEndpoints.addOrder,
        data: orderModel.toJson(),
        documentId: orderModel.orderId,
      );
      return right(null);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
