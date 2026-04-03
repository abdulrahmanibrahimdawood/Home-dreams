import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:home_dreams/constants.dart';
import 'package:home_dreams/core/helper_funcations/get_user.dart';
import 'package:home_dreams/core/utils/app_images.dart';
import 'package:home_dreams/core/utils/app_text_styles.dart';
import 'package:home_dreams/features/profile/presentation/manager/cubit/upload_image_cubit.dart';
import 'package:image_picker/image_picker.dart';

class UserCard extends StatefulWidget {
  const UserCard({super.key});

  @override
  State<UserCard> createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {
  File? selectedImage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Row(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: 73,
                height: 73,
                decoration: const ShapeDecoration(shape: OvalBorder()),
                child: ClipOval(
                  child: selectedImage != null
                      ? Image.file(selectedImage!, fit: BoxFit.cover)
                      : Image.asset(
                          Assets.assetsImagesUserProfileImage,
                          fit: BoxFit.cover,
                        ),
                ),
              ),
              Positioned(
                bottom: -14,
                left: 0,
                right: 0,
                child: GestureDetector(
                  onTap: () async {
                    final picker = ImagePicker();

                    final XFile? image = await picker.pickImage(
                      source: ImageSource.gallery,
                    );

                    if (image != null) {
                      final file = File(image.path);

                      context.read<UploadImageCubit>().uploadImage(file);
                    }
                  },
                  child: Center(
                    child: SvgPicture.asset(Assets.assetsImagesCamera),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 24),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(getUser().name, style: TextStyles.bold13),
              Text(
                getUser().email,
                style: TextStyles.regular13.copyWith(color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
