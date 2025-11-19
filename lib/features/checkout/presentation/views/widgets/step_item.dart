import 'package:flutter/material.dart';
import 'package:home_dreams/features/checkout/presentation/views/widgets/active_step_item.dart';
import 'package:home_dreams/features/checkout/presentation/views/widgets/inactive_step_item.dart';

class StepItem extends StatelessWidget {
  const StepItem({
    super.key,
    required this.index,
    required this.text,
    required this.isActive,
  });
  final String index, text;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      duration: const Duration(milliseconds: 300),
      crossFadeState: isActive
          ? CrossFadeState.showFirst
          : CrossFadeState.showSecond,
      firstChild: ActiveStepItem(text: text),
      secondChild: InActiveStepItem(text: text, index: index),
    );
  }
}
