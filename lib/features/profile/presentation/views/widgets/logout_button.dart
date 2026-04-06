import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:home_dreams/core/utils/app_images.dart';
import 'package:home_dreams/core/utils/app_text_styles.dart';
import 'package:home_dreams/features/auth/presentation/views/signin_view.dart';
import 'package:home_dreams/features/profile/presentation/manager/signout_cubit/signout_cubit.dart';
import 'package:home_dreams/generated/l10n.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignoutCubit, SignoutState>(
      listener: (context, state) {
        if (state is SignedOut) {
          Navigator.pushReplacementNamed(context, SigninView.routeName);
        } else if (state is SignoutFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      builder: (context, state) {
        final isLoading = state is SignoutLoading;

        return GestureDetector(
          onTap: isLoading
              ? null
              : () {
                  context.read<SignoutCubit>().signOut();
                },
          child: Container(
            width: double.infinity,
            height: 56,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceContainer,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const SizedBox(),
                isLoading
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : Text(
                        S.of(context).logout,
                        style: TextStyles.semiBold13.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                SvgPicture.asset(Assets.assetsImagesLogoutIcon),
              ],
            ),
          ),
        );
      },
    );
  }
}
