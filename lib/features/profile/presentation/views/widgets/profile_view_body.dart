import 'package:flutter/material.dart';
import 'package:home_dreams/constants.dart';
import 'package:home_dreams/core/utils/app_images.dart';
import 'package:home_dreams/core/utils/app_text_styles.dart';
import 'package:home_dreams/features/profile/presentation/views/widgets/logout_button.dart';
import 'package:home_dreams/features/profile/presentation/views/widgets/profile_settings_item.dart';
import 'package:home_dreams/features/profile/presentation/views/widgets/user_card.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16),
        UserCard(),
        SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
          child: Text('عام', style: TextStyles.semiBold13),
        ),
        SizedBox(height: 16),
        ProfileSettingsItem(
          text: 'الملف الشخصي',
          imagePath: Assets.assetsImagesProfileIconSettings,
        ),
        SizedBox(height: 4),
        ProfileSettingsItem(
          text: 'طلباتي',
          imagePath: Assets.assetsImagesMyOrders,
        ),
        SizedBox(height: 4),
        ProfileSettingsItem(
          text: 'المفضلة',
          imagePath: Assets.assetsImagesFavorite,
        ),
        SizedBox(height: 4),
        ProfileSettingsItem(
          text: 'الاشعارات',
          imagePath: Assets.assetsImagesNotificationSettingsIcon,
        ),
        SizedBox(height: 4),
        ProfileSettingsItem(
          text: 'اللغة',
          imagePath: Assets.assetsImagesLaungauge,
        ),
        SizedBox(height: 4),
        ProfileSettingsItem(text: 'الوضع', imagePath: Assets.assetsImagesMode),
        SizedBox(height: 22),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
          child: Text('المساعده'),
        ),
        SizedBox(height: 16),
        ProfileSettingsItem(
          text: 'من نحن',
          imagePath: Assets.assetsImagesWeAreWe,
        ),
        Spacer(),
        LogoutButton(onTap: () {}),
        SizedBox(height: 32),
      ],
    );
  }
}
