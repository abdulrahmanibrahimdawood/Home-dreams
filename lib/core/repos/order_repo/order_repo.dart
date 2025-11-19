import 'package:dartz/dartz.dart';
import 'package:home_dreams/core/errors/failures.dart';
import 'package:home_dreams/features/checkout/domain/entites/order_input_entity.dart';

abstract class OrderRepo {
  Future<Either<Failure, void>> createOrder({required OrderInputEntity order});
}
