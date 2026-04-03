import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_dreams/core/services/get_it_services.dart';
import 'package:home_dreams/core/widgets/custom_app_bar_inside.dart';
import 'package:home_dreams/features/checkout/domain/repo/images_repo.dart';
import 'package:home_dreams/features/profile/presentation/manager/cubit/upload_image_cubit.dart';
import 'package:home_dreams/features/profile/presentation/manager/get_profile_image_cubit/get_profile_image_cubit.dart';
import 'package:home_dreams/features/profile/presentation/views/widgets/profile_view_body.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});
  static const routeName = 'profile';

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  String url = '';
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UploadImageCubit(getIt<ImagesRepo>()),
        ),
        BlocProvider(
          create: (context) =>
              GetProfileImageCubit(imagesRepo: getIt<ImagesRepo>())
                ..getProfileImage(),
        ),
      ],
      child: BlocListener<GetProfileImageCubit, GetProfileImageState>(
        listener: (context, state) {
          if (state is GetProfileImageSuccess) {
            final imageUrl = state.imageUrl;
            setState(() {
              url = imageUrl;
            });
          }
        },
        child: Scaffold(
          appBar: buildAppBarInside(
            context,
            title: 'حسابي',
            showNotification: false,
            showBackButton: false,
          ),
          body: ProfileViewBody(url),
        ),
      ),
    );
  }
}
