import 'dart:io';

import 'package:flutter/material.dart';
import 'package:home_dreams/core/utils/app_images.dart';

class CustomContainerImage extends StatelessWidget {
  const CustomContainerImage({
    super.key,
    required this.selectedImage,
    required this.oldImage,
  });

  final File? selectedImage;
  final String oldImage;

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
