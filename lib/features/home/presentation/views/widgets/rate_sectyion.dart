import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:home_dreams/core/utils/app_images.dart';
import 'package:home_dreams/core/utils/app_text_styles.dart';
import 'package:home_dreams/generated/l10n.dart';

class RateSection extends StatelessWidget {
  const RateSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(Assets.assetsImagesStar),
        const SizedBox(width: 6),
        Text(
          '4.5',
          style: TextStyles.semiBold13.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(width: 6),
        Text(
          '(30+)',
          style: TextStyles.semiBold13.copyWith(
            color: Theme.of(context).textTheme.bodySmall!.color,
          ),
        ),

        const SizedBox(width: 6),

        Text(
          S.of(context).reviews,
          style: TextStyles.bold13.copyWith(
            color: Theme.of(context).textTheme.bodyMedium!.color,
          ),
        ),
      ],
    );
  }
}
