import 'package:dartz/dartz.dart' show Either, Unit;
import 'package:home_dreams/core/errors/failures.dart';
import 'package:home_dreams/features/auth/domain/entites/user_entity.dart';

abstract class UpdateUserDataRepo {
  Future<Either<Failure, UserEntity>> updateUserName({required String name});
  Future<Either<Failure, Unit>> updatePassword({
    required String oldPassword,
    required String newPassword,
  });
  Future<Either<Failure, Unit>> updateEmail({
    required String newEmail,
    required String password,
  });
}
