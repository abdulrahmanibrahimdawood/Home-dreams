import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:home_dreams/constants.dart';
import 'package:home_dreams/core/utils/app_images.dart';
import 'package:home_dreams/core/utils/app_text_styles.dart';

class ProfileSettingsItem extends StatelessWidget {
  const ProfileSettingsItem({
    super.key,
    required this.imagePath,
    required this.text,
    this.trailing,
    this.onTap,
  });
  final String imagePath;
  final Widget? trailing;
  final void Function()? onTap;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),

      child: Column(
        children: [
          InkWell(
            onTap: onTap,
            child: ListTile(
              dense: true,
              contentPadding: const EdgeInsets.symmetric(horizontal: 0),
              visualDensity: VisualDensity(
                horizontal: VisualDensity.minimumDensity,
              ),
              internalAddSemanticForOnTap: true,
              title: Text(
                text,
                style: TextStyles.semiBold13.copyWith(color: Color(0xff949D9E)),
              ),
              leading: SvgPicture.asset(imagePath),
              trailing:
                  trailing ??
                  SvgPicture.asset(Assets.assetsImagesArrowBackIcon),
            ),
          ),
          Divider(height: 1, color: const Color(0xffC3C2C2)),
        ],
      ),
    );
  }
}
