import 'package:flutter/material.dart';
import 'package:home_dreams/core/utils/app_text_styles.dart';

class ActiveStepItem extends StatelessWidget {
  const ActiveStepItem({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 11.5,
          backgroundColor: Theme.of(context).colorScheme.primary,
          child: Icon(
            Icons.check,
            color: Theme.of(context).colorScheme.onPrimary,
            size: 18,
          ),
        ),
        const SizedBox(width: 4),
        Text(
          text,
          style: TextStyles.bold13.copyWith(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ],
    );
  }
}
