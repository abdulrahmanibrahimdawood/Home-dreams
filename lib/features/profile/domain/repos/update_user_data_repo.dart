import 'package:dartz/dartz.dart' show Either;
import 'package:home_dreams/core/errors/failures.dart';
import 'package:home_dreams/features/auth/domain/entites/user_entity.dart';

abstract class UpdateUserDataRepo {
  Future<Either<Failure, UserEntity>> updateUserName({required String name});
}
