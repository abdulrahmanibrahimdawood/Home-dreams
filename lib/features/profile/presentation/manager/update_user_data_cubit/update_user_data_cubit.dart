import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show Cubit;
import 'package:home_dreams/features/auth/domain/entites/user_entity.dart';
import 'package:home_dreams/features/profile/domain/repos/update_user_data_repo.dart';

part 'update_user_data_state.dart';

class UpdateUserDataCubit extends Cubit<UpdateUserDataState> {
  UpdateUserDataCubit(this.updateUserDataRepo) : super(UpdateUserDataInitial());
  final UpdateUserDataRepo updateUserDataRepo;

  Future<void> updateUserName({required String name}) async {
    emit(UpdateUserNameLoading());
    var result = await updateUserDataRepo.updateUserName(name: name);
    result.fold(
      (failure) => emit(UpdateUserNameFailure(message: failure.message)),
      (userEntity) => emit(UpdateUserNameSuccess(userEntity: userEntity)),
    );
  }

  Future<void> updatePassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    emit(UpdatePasswordLoading());
    var result = await updateUserDataRepo.updatePassword(
      oldPassword: oldPassword,
      newPassword: newPassword,
    );
    result.fold(
      (failure) => emit(UpdatePasswordFailure(message: failure.message)),
      (userEntity) => emit(UpdatePasswordSuccess()),
    );
  }

  Future<void> updateEmail({
    required String newEmail,
    required String password,
  }) async {
    emit(UpdateEmailLoading());
    var result = await updateUserDataRepo.updateEmail(
      newEmail: newEmail,
      password: password,
    );
    result.fold(
      (failure) => emit(UpdateEmailFailure(message: failure.message)),
      (userEntity) => emit(UpdateEmailSuccess()),
    );
  }
}
