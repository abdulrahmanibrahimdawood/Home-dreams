import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:home_dreams/features/auth/domain/repos/auth_repo.dart';

part 'signout_state.dart';

class SignoutCubit extends Cubit<SignoutState> {
  SignoutCubit({required this.authRepo}) : super(SignoutInitial());
  final AuthRepo authRepo;

  Future<void> signOut() async {
    emit(SignoutLoading());
    try {
      await Future.delayed(const Duration(seconds: 3));
      await authRepo.signOut();
      emit(SignedOut());
    } catch (e) {
      emit(SignoutFailure(e.toString()));
    }
  }
}
