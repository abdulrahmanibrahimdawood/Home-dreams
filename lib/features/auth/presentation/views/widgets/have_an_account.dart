import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:home_dreams/core/utils/app_text_styles.dart';
import 'package:home_dreams/generated/l10n.dart';

class HaveAnAccountWidget extends StatelessWidget {
  const HaveAnAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: s.haveAccountQuestion,
            style: TextStyles.semiBold16.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
          TextSpan(
            text: ' ',
            style: TextStyles.semiBold16.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          TextSpan(
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pop(context);
              },
            text: s.login,
            style: TextStyles.semiBold16.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
