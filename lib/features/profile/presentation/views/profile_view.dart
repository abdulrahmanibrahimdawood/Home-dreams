import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_dreams/core/services/get_it_services.dart';
import 'package:home_dreams/core/widgets/custom_app_bar_inside.dart';
import 'package:home_dreams/features/checkout/domain/repo/images_repo.dart';
 import 'package:home_dreams/features/profile/presentation/manager/cubit/upload_image_cubit.dart';
 import 'package:home_dreams/features/profile/presentation/views/widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});
  static const routeName = 'profile';
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => UploadImageCubit(getIt<ImagesRepo>())),
       ],
      child: Scaffold(
        appBar: buildAppBarInside(
          context,
          title: 'حسابي',
          showNotification: false,
          showBackButton: false,
        ),
        body: const ProfileViewBody(),
      ),
    );
  }
}
