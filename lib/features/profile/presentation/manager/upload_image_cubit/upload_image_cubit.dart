import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show Cubit;
import 'package:home_dreams/features/checkout/domain/repo/images_repo.dart';

part 'upload_image_state.dart';

class UploadImageCubit extends Cubit<UploadImageState> {
  final ImagesRepo imagesRepo;

  UploadImageCubit(this.imagesRepo) : super(UploadImageInitial());

  Future<void> uploadImage(File image) async {
    emit(UploadImageLoading());

    final result = await imagesRepo.uploadImage(image);

    result.fold(
      (failure) => emit(UploadImageFailure(failure.message)),
      (url) => emit(UploadImageSuccess(url)),
    );
  }
}
