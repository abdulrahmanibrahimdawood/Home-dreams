import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show Cubit;
import 'package:home_dreams/features/auth/domain/entites/user_entity.dart';
import 'package:home_dreams/features/profile/domain/repos/update_user_data_repo.dart';

part 'update_user_data_state.dart';

class UpdateUserDataCubit extends Cubit<UpdateUserDataState> {
  UpdateUserDataCubit(this.updateUserDataRepo) : super(UpdateUserDataInitial());
  final UpdateUserDataRepo updateUserDataRepo;

  Future<void> updateUserName({required String name}) async {
    emit(UpdateUserDataLoading());
    var result = await updateUserDataRepo.updateUserName(name: name);
    result.fold(
      (failure) => emit(UpdateUserDataFailure(message: failure.message)),
      (userEntity) => emit(UpdateUserDataSuccess(userEntity: userEntity)),
    );
  }
}
