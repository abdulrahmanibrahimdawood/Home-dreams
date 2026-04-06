part of 'signout_cubit.dart';

sealed class SignoutState extends Equatable {
  const SignoutState();

  @override
  List<Object> get props => [];
}

final class SignoutInitial extends SignoutState {}

class SignoutLoading extends SignoutState {}

class SignedOut extends SignoutState {}

class SignoutFailure extends SignoutState {
  final String message;
  const SignoutFailure(this.message);
}
