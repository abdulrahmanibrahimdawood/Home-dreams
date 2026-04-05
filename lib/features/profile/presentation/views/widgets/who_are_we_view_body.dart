import 'package:flutter/material.dart';
import 'package:home_dreams/constants.dart';
import 'package:home_dreams/core/utils/app_text_styles.dart';
import 'package:home_dreams/generated/l10n.dart';

class WhoAreWeViewBody extends StatelessWidget {
  const WhoAreWeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 24),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(text: s.aboutCompanyPrefix, style: TextStyles.bold16),
                TextSpan(
                  text: '${s.appName} \n',
                  style: TextStyles.bold16.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ],
            ),
          ),

          Text(s.whoAreWeIntro, style: TextStyles.regular13),
          SizedBox(height: 12),

          Text(s.whoAreWeParagraph2, style: TextStyles.regular13),
          SizedBox(height: 16),

          Text(
            s.ourServices,
            style: TextStyles.bold13.copyWith(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          SizedBox(height: 8),

          Text(s.whoAreWeServicesList, style: TextStyles.regular13),
        ],
      ),
    );
  }
}
