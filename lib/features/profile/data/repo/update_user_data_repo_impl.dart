import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:home_dreams/core/errors/exceptions.dart';
import 'package:home_dreams/core/errors/failures.dart';
import 'package:home_dreams/core/helper_funcations/get_user.dart';
import 'package:home_dreams/core/services/data_service.dart';
import 'package:home_dreams/core/services/firebase_auth_service.dart';
import 'package:home_dreams/core/utils/backend_endpoints.dart';
import 'package:home_dreams/features/auth/data/models/user_model.dart';
import 'package:home_dreams/features/auth/domain/entites/user_entity.dart';
import 'package:home_dreams/features/auth/domain/repos/auth_repo.dart';
import 'package:home_dreams/features/profile/domain/repos/update_user_data_repo.dart';

class UpdateUserDataRepoImpl implements UpdateUserDataRepo {
  final FirebaseAuthService firebaseAuthService;
  final DatabaseServices databaseServices;
  final AuthRepo authRepo;

  UpdateUserDataRepoImpl({
    required this.authRepo,
    required this.firebaseAuthService,
    required this.databaseServices,
  });

  @override
  Future<Either<Failure, UserEntity>> updateUserName({
    required String name,
  }) async {
    try {
      await firebaseAuthService.updateDisplayName(name: name);

      final user = FirebaseAuth.instance.currentUser!;
      final updatedUser = UserEntity(
        name: name,
        email: user.email!,
        uId: user.uid,
      );

      await databaseServices.updateData(
        path: BackendEndpoints.updateUserData,
        documentId: user.uid,
        data: UserModel.fromEntity(updatedUser).toMap(),
      );

      await authRepo.saveUserData(user: updatedUser);
      return right(updatedUser);
    } on CustomException catch (e) {
      return left(
        ServerFailure(
          'Exception in UpdateUserDataRepoImpl.updateUserName: ${e.message}',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, Unit>> updatePassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await firebaseAuthService.reauthenticate(
        email: user.email!,
        password: oldPassword,
      );
      await firebaseAuthService.updatePassword(newPassword: newPassword);
      return right(unit);
    } on CustomException catch (e) {
      return left(
        ServerFailure(
          'Exception in UpdateUserDataRepoImpl.updatePassword: ${e.message}',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, Unit>> updateEmail({
    required String newEmail,
    required String password,
  }) async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await firebaseAuthService.reauthenticate(
        email: user.email!,
        password: password,
      );

      await firebaseAuthService.updateEmail(newEmail: newEmail);

      await databaseServices.updateData(
        path: BackendEndpoints.updateUserData,
        documentId: user.uid,
        data: {'email': newEmail},
      );

      final updatedUser = UserEntity(
        name: getUser().name,
        email: newEmail,
        uId: user.uid,
      );

      await authRepo.saveUserData(user: updatedUser);

      return right(unit);
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    }
  }
}
