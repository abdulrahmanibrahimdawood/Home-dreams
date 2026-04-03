import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:home_dreams/constants.dart';
import 'package:home_dreams/core/helper_funcations/build_error_bar.dart';
import 'package:home_dreams/core/helper_funcations/get_user.dart';
import 'package:home_dreams/core/utils/app_images.dart';
import 'package:home_dreams/core/utils/app_text_styles.dart';
import 'package:home_dreams/features/profile/presentation/manager/cubit/upload_image_cubit.dart';
import 'package:home_dreams/features/profile/presentation/views/widgets/custom_image_container.dart';
import 'package:image_picker/image_picker.dart';

class UserCard extends StatefulWidget {
  const UserCard({super.key});

  @override
  State<UserCard> createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {
  File? selectedImage;

  @override
  @override
  Widget build(BuildContext context) {
    final user = getUser();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Row(
        children: [
          BlocConsumer<UploadImageCubit, UploadImageState>(
            listener: (context, state) {
              if (state is UploadImageSuccess) {
                showBar(context, 'تم تحديث الصورة بنجاح');
              } else if (state is UploadImageFailure) {
                showBar(context, 'حدث خطأ أثناء تحديث الصورة');
              }
            },
            builder: (context, state) {
              return Stack(
                clipBehavior: Clip.none,
                children: [
                  CustomContainerImage(selectedImage: selectedImage),
                  Positioned(
                    bottom: -14,
                    left: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () async {
                        await uploadImage(context);
                      },
                      child: Center(
                        child: SvgPicture.asset(Assets.assetsImagesCamera),
                      ),
                    ),
                  ),
                  if (state is UploadImageLoading)
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: .3),
                          shape: BoxShape.circle,
                        ),
                        child: const Center(
                          child: CircularProgressIndicator(color: Colors.white),
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
          const SizedBox(width: 24),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(user.name, style: TextStyles.bold13),
              Text(
                user.email,
                style: TextStyles.regular13.copyWith(color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> uploadImage(BuildContext context) async {
    final picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      final file = File(image.path);
      setState(() {
        selectedImage = file;
      });
      context.read<UploadImageCubit>().uploadImage(file);
    }
  }
}
