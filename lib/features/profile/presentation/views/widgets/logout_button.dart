import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:home_dreams/core/utils/app_colors.dart';
import 'package:home_dreams/core/utils/app_images.dart';
import 'package:home_dreams/core/utils/app_text_styles.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key, this.onTap});
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 56,
        decoration: BoxDecoration(color: Color(0xffF4EBE6)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(),
            Text(
              'تسجيل الخروج',
              style: TextStyles.semiBold13.copyWith(
                color: AppColors.primaryColor,
              ),
            ),
            SvgPicture.asset(Assets.assetsImagesLogoutIcon),
          ],
        ),
      ),
    );
  }
}
