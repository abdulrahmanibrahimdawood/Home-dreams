part of 'update_user_data_cubit.dart';

sealed class UpdateUserDataState extends Equatable {
  const UpdateUserDataState();

  @override
  List<Object> get props => [];
}

final class UpdateUserDataInitial extends UpdateUserDataState {}

final class UpdateUserNameLoading extends UpdateUserDataState {}

final class UpdateUserNameSuccess extends UpdateUserDataState {
  final UserEntity userEntity;
  const UpdateUserNameSuccess({required this.userEntity});
}

final class UpdateUserNameFailure extends UpdateUserDataState {
  final String message;
  const UpdateUserNameFailure({required this.message});
}

//============================= Update Password States =====================
final class UpdatePasswordLoading extends UpdateUserDataState {}

final class UpdatePasswordSuccess extends UpdateUserDataState {}

final class UpdatePasswordFailure extends UpdateUserDataState {
  final String message;
  const UpdatePasswordFailure({required this.message});
}

//============================= Update Email States =======================

final class UpdateEmailLoading extends UpdateUserDataState {}

final class UpdateEmailSuccess extends UpdateUserDataState {}

final class UpdateEmailFailure extends UpdateUserDataState {
  final String message;
  const UpdateEmailFailure({required this.message});
}
