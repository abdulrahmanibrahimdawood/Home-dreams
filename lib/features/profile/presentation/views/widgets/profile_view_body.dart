import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:home_dreams/constants.dart';
import 'package:home_dreams/core/helper_funcations/is_arabic.dart';
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
import 'package:home_dreams/generated/l10n.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody(this.imageUrl, {super.key});
  final String? imageUrl;
  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16),
        UserCard(imageUrl: imageUrl),
        SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
          child: Text(s.generalSection, style: TextStyles.semiBold13),
        ),
        SizedBox(height: 16),
        ProfileSettingsItem(
          onTap: () {
            Navigator.pushNamed(context, EditProfileView.routeName);
          },
          text: s.personalProfile,
          imagePath: Assets.assetsImagesProfileIconSettings,
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

          text: s.favorites,
          imagePath: Assets.assetsImagesFavorite,
        ),

        SizedBox(height: 4),
        ProfileSettingsItem(
          text: s.language,
          imagePath: Assets.assetsImagesLaungauge,
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                s.arabic,
                style: TextStyles.regular13.copyWith(
                  color: const Color(0xFF0C0D0D),
                ),
              ),
              SizedBox(width: 2),
              isArabic() ? SvgPicture.asset(Assets.assetsImagesArrowBackIcon) :
              Transform.rotate(angle:pi, child: SvgPicture.asset(Assets.assetsImagesArrowBackIcon)),
            ],
          ),
        ),
        SizedBox(height: 4),
        ProfileSettingsItem(
          text: s.appearanceMode,
          imagePath: Assets.assetsImagesMode,
          trailing: CustomCupertinoSwitch(onChanged: (value) {}),
        ),
        SizedBox(height: 22),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
          child: Text(s.help),
        ),
        SizedBox(height: 16),
        ProfileSettingsItem(
          onTap: () {
            Navigator.pushNamed(context, WhoAreWeView.routeName);
          },
          text: s.whoWeAre,
          imagePath: Assets.assetsImagesWhoAreWe,
        ),
        Spacer(),
        LogoutButton(onTap: () {}),
        SizedBox(height: 32),
      ],
    );
  }
}
