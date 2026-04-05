import 'package:flutter/material.dart';
import 'package:home_dreams/core/utils/app_text_styles.dart';
import 'package:home_dreams/generated/l10n.dart';

class ShippingItem extends StatelessWidget {
  const ShippingItem({
    super.key,
    required this.title,
    required this.subTitle,
    required this.price,
    required this.isSelected,
    required this.onTap,
  });
  final String title, subTitle, price;
  final bool isSelected;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        padding: const EdgeInsets.only(
          top: 16,
          left: 13,
          right: 28,
          bottom: 16,
        ),
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: Theme.of(
            context,
          ).colorScheme.outlineVariant.withValues(alpha: 0.2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
            side: BorderSide(
              color: isSelected
                  ? Theme.of(context).colorScheme.primary
                  : Colors.transparent,
            ),
          ),
        ),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              isSelected
                  ? const ActiveShippingItemDot()
                  : const InActiveShippingItemDot(),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: TextStyles.semiBold13),
                  SizedBox(height: 6),
                  Text(
                    subTitle,
                    style: TextStyles.regular13.copyWith(
                      color: Theme.of(
                        context,
                      ).colorScheme.onSurface.withValues(alpha: .5),
                    ),
                  ),
                ],
              ),
              Spacer(),
              Center(
                child: Text(
                  '$price ${S.of(context).currencyEgp}',
                  style: TextStyles.bold13.copyWith(
                    color: Theme.of(context).colorScheme.primaryContainer,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ActiveShippingItemDot extends StatelessWidget {
  const ActiveShippingItemDot({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 18,
      height: 18,
      decoration: ShapeDecoration(
        color: Theme.of(context).colorScheme.primary,
        shape: OvalBorder(
          side: BorderSide(
            width: 4,
            color: Theme.of(context).colorScheme.surfaceContainerHighest,
          ),
        ),
      ),
    );
  }
}

class InActiveShippingItemDot extends StatelessWidget {
  const InActiveShippingItemDot({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 18,
      height: 18,
      decoration: ShapeDecoration(
        shape: OvalBorder(
          side: BorderSide(
            width: 1,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
      ),
    );
  }
}
