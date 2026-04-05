import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:home_dreams/core/utils/app_images.dart';
import 'package:home_dreams/core/utils/app_text_styles.dart';
import 'package:home_dreams/generated/l10n.dart';

class NoProductsWidget extends StatelessWidget {
  const NoProductsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 8),

            Text(
              S.of(context).noSearchResults,
              style: TextStyles.semiBold13.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.08),
            SvgPicture.asset(Assets.assetsImagesNoporducts),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.05),
            Text(
              S.of(context).infoNotAvailable,
              style: TextStyles.semiBold13.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
