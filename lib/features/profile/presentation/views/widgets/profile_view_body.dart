import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:home_dreams/constants.dart';
import 'package:home_dreams/core/utils/app_images.dart';
import 'package:home_dreams/core/utils/app_text_styles.dart';
import 'package:home_dreams/features/favorites/presentation/views/favorites_view.dart';
import 'package:home_dreams/features/favorites/presentation/views/manager/favorite_cubit/favorite_cubit.dart';
import 'package:home_dreams/features/home/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:home_dreams/features/profile/presentation/views/edit_profile_view.dart';
import 'package:home_dreams/features/profile/presentation/views/who_are_we_view.dart';
import 'package:home_dreams/features/profile/presentation/views/widgets/custom_cupertino_switch.dart';
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
          onTap: () {
            Navigator.pushNamed(context, EditProfileView.routeName);
          },
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
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider.value(value: context.read<FavoriteCubit>()),
                    BlocProvider.value(value: context.read<CartCubit>()),
                  ],
                  child: const FavoritesView(),
                ),
              ),
            );
          },

          text: 'المفضلة',
          imagePath: Assets.assetsImagesFavorite,
        ),
        SizedBox(height: 4),
        ProfileSettingsItem(
          text: 'الاشعارات',
          imagePath: Assets.assetsImagesNotificationSettingsIcon,
          trailing: CustomCupertinoSwitch(onChanged: (value) {}),
        ),
        SizedBox(height: 4),
        ProfileSettingsItem(
          text: 'اللغة',
          imagePath: Assets.assetsImagesLaungauge,
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'العربية',
                style: TextStyles.regular13.copyWith(
                  color: const Color(0xFF0C0D0D),
                ),
              ),
              SizedBox(width: 2),
              SvgPicture.asset(Assets.assetsImagesArrowBackIcon),
            ],
          ),
        ),
        SizedBox(height: 4),
        ProfileSettingsItem(
          text: 'الوضع',
          imagePath: Assets.assetsImagesMode,
          trailing: CustomCupertinoSwitch(onChanged: (value) {}),
        ),
        SizedBox(height: 22),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
          child: Text('المساعده'),
        ),
        SizedBox(height: 16),
        ProfileSettingsItem(
          onTap: () {
            Navigator.pushNamed(context, WhoAreWeView.routeName);
          },
          text: 'من نحن',
          imagePath: Assets.assetsImagesWhoAreWe,
        ),
        Spacer(),
        LogoutButton(onTap: () {}),
        SizedBox(height: 32),
      ],
    );
  }
}
