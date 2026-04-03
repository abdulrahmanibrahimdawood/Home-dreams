part of 'get_profile_image_cubit.dart';

sealed class GetProfileImageState extends Equatable {
  const GetProfileImageState();

  @override
  List<Object> get props => [];
}

final class GetProfileImageInitial extends GetProfileImageState {}

final class GetProfileImageLoading extends GetProfileImageState {}

final class GetProfileImageSuccess extends GetProfileImageState {
  final String imageUrl;

  const GetProfileImageSuccess(this.imageUrl);

  @override
  List<Object> get props => [imageUrl];
}

final class GetProfileImageFailure extends GetProfileImageState {
  final String message;

  const GetProfileImageFailure(this.message);

  @override
  List<Object> get props => [message];
}
