part of 'upload_image_cubit.dart';

sealed class UploadImageState extends Equatable {
  const UploadImageState();

  @override
  List<Object> get props => [];
}

class UploadImageInitial extends UploadImageState {}

class UploadImageLoading extends UploadImageState {}

class UploadImageSuccess extends UploadImageState {
  final String imageUrl;

  const UploadImageSuccess(this.imageUrl);
}

class UploadImageFailure extends UploadImageState {
  final String error;

  const UploadImageFailure(this.error);
}
