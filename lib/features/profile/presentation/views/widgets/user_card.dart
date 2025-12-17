import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:home_dreams/core/helper_funcations/get_user.dart';
import 'package:home_dreams/core/utils/app_images.dart';
import 'package:home_dreams/core/utils/app_text_styles.dart';

class UserCard extends StatelessWidget {
  const UserCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: 73,
              height: 73,
              decoration: ShapeDecoration(shape: OvalBorder()),
              child: Image.asset(
                Assets.assetsImagesUserProfileImage,
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              bottom: -14,
              left: 0,
              right: 0,
              child: Center(child: SvgPicture.asset(Assets.assetsImagesCamera)),
            ),
          ],
        ),
        SizedBox(width: 24),
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
    );
  }
}
