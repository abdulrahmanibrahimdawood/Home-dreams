import 'package:flutter/material.dart';
import 'package:home_dreams/core/utils/app_text_styles.dart';
import 'package:home_dreams/generated/l10n.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(color: Theme.of(context).colorScheme.outline)),
        const SizedBox(width: 18),
        Text(
          S.of(context).orDivider,
          style: TextStyles.semiBold16,
          textAlign: TextAlign.center,
        ),
        const SizedBox(width: 18),
        Expanded(child: Divider(color: Theme.of(context).colorScheme.outline)),
      ],
    );
  }
}
