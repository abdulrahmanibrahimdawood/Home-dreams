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
import 'package:home_dreams/features/profile/presentation/manager/local_provider/local_provider.dart';
import 'package:home_dreams/features/profile/presentation/manager/theme_provider/theme_provider.dart';
import 'package:home_dreams/features/profile/presentation/views/edit_profile_view.dart';
import 'package:home_dreams/features/profile/presentation/views/who_are_we_view.dart';
import 'package:home_dreams/features/profile/presentation/views/widgets/custom_cupertino_switch.dart';
import 'package:home_dreams/features/profile/presentation/views/widgets/logout_button.dart';
import 'package:home_dreams/features/profile/presentation/views/widgets/profile_settings_item.dart';
import 'package:home_dreams/features/profile/presentation/views/widgets/user_card.dart';
import 'package:home_dreams/generated/l10n.dart';
import 'package:provider/provider.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody(this.imageUrl, {super.key});
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final localeProvider = Provider.of<LocaleProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        UserCard(imageUrl: imageUrl),
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
          child: Text(s.generalSection, style: TextStyles.semiBold13),
        ),
        const SizedBox(height: 16),
        ProfileSettingsItem(
          onTap: () {
            Navigator.pushNamed(context, EditProfileView.routeName);
          },
          text: s.personalProfile,
          imagePath: Assets.assetsImagesProfileIconSettings,
        ),
        const SizedBox(height: 4),
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
        const SizedBox(height: 4),
        ProfileSettingsItem(
          text: s.language,
          imagePath: Assets.assetsImagesLaungauge,
          trailing: InkWell(
            onTap: () => showLanguageDialog(context),
            child: Builder(
              builder: (context) {
                // final isDark = context.watch<ThemeProvider>().isDark;

                return Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      localeProvider.currentLang == AppLanguage.arabic
                          ? s.arabic
                          : 'English',
                      style: TextStyles.regular13.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(width: 2),
                    Transform.rotate(
                      angle: isArabic() ? 0 : pi,
                      child: SvgPicture.asset(
                        Assets.assetsImagesArrowBackIcon,
                        colorFilter: ColorFilter.mode(
                          Theme.of(context).colorScheme.onSurface,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
        const SizedBox(height: 4),
        ProfileSettingsItem(
          text: s.appearanceMode,
          imagePath: Assets.assetsImagesMode,
          trailing: Consumer<ThemeProvider>(
            builder: (context, themeProvider, _) {
              return CustomCupertinoSwitch(
                value: themeProvider.isDark,
                onChanged: (value) {
                  themeProvider.toggleTheme(value);
                },
              );
            },
          ),
        ),
        const SizedBox(height: 22),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
          child: Text(s.help),
        ),
        const SizedBox(height: 16),
        ProfileSettingsItem(
          onTap: () {
            Navigator.pushNamed(context, WhoAreWeView.routeName);
          },
          text: s.whoWeAre,
          imagePath: Assets.assetsImagesWhoAreWe,
        ),
        const Spacer(),
        LogoutButton(onTap: () {}),
        const SizedBox(height: 32),
      ],
    );
  }
}

void showLanguageDialog(BuildContext context) {
  final localeProvider = Provider.of<LocaleProvider>(context, listen: false);
  final currentLang = localeProvider.currentLang;

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(S.of(context).chooseLanguage),
        content: Column(
          mainAxisSize: MainAxisSize.min,

          children: [
            ListTile(
              title: const Text("العربية"),
              trailing: currentLang == AppLanguage.arabic
                  ? const Icon(Icons.check)
                  : null,
              onTap: () {
                localeProvider.changeLanguage(AppLanguage.arabic);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text("English"),
              trailing: currentLang == AppLanguage.english
                  ? const Icon(Icons.check)
                  : null,
              onTap: () {
                localeProvider.changeLanguage(AppLanguage.english);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      );
    },
  );
}
