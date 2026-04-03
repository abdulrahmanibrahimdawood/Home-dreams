import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:home_dreams/core/helper_funcations/get_user.dart';
import 'package:home_dreams/features/checkout/domain/repo/images_repo.dart';

part 'get_profile_image_state.dart';

class GetProfileImageCubit extends Cubit<GetProfileImageState> {
  GetProfileImageCubit({required this.imagesRepo})
    : super(GetProfileImageInitial());
  final ImagesRepo imagesRepo;
  Future<void> getProfileImage() async {
    final user = getUser();
    emit(GetProfileImageLoading());
    final result = await imagesRepo.getImage(user.uId);
    result.fold(
      (failure) => emit(GetProfileImageFailure(failure.message)),
      (url) => emit(GetProfileImageSuccess(url)),
    );
  }
}
