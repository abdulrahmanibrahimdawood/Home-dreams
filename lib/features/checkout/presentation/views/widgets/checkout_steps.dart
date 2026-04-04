import 'package:flutter/material.dart';
import 'package:home_dreams/features/checkout/presentation/views/widgets/step_item.dart';
import 'package:home_dreams/generated/l10n.dart';

class CheckoutSteps extends StatelessWidget {
  const CheckoutSteps({
    super.key,
    required this.currentPageIndex,
    required this.pageController,
    required this.onTap,
  });
  final int currentPageIndex;
  final PageController pageController;
  final ValueChanged<int> onTap;
  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final steps = [
      s.checkoutStepShipping,
      s.checkoutStepAddress,
      s.checkoutStepPayment,
    ];
    return Row(
      children: List.generate(steps.length, (index) {
        return Expanded(
          child: GestureDetector(
            onTap: () {
              onTap(index);
            },
            child: StepItem(
              text: steps[index],
              index: (index + 1).toString(),
              isActive: index <= currentPageIndex,
            ),
          ),
        );
      }),
    );
  }
}
