import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_dreams/core/utils/app_text_styles.dart';
import 'package:home_dreams/features/checkout/domain/entites/order_input_entity.dart';
import 'package:home_dreams/features/checkout/presentation/views/widgets/payment_item.dart';
import 'package:home_dreams/generated/l10n.dart';

class OrderSummaryWidget extends StatelessWidget {
  const OrderSummaryWidget({super.key, required this.pageController});
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return PaymentItem(
      title: s.orderSummary,
      child: Column(
        children: [
          Row(
            children: [
              Text(
                s.subtotalLabel,
                style: TextStyles.regular13.copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant),
              ),
              Spacer(),
              Text(
                '${context.read<OrderInputEntity>().cartEntity.calculateTotalPrice()} ${s.currencyEgp}',
                style: TextStyles.semiBold16,
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Text(
                s.deliveryLabel,
                style: TextStyles.regular13.copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant),
              ),
              Spacer(),
              Text(
                s.deliveryFee,
                style: TextStyles.regular13.copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant),
              ),
            ],
          ),
          SizedBox(height: 9),
          Divider(thickness: 0.6, color: Theme.of(context).colorScheme.outlineVariant),
          SizedBox(height: 9),
          Row(
            children: [
              Text(s.totalLabel, style: TextStyles.bold16),
              Spacer(),
              Text(
                '${context.read<OrderInputEntity>().cartEntity.calculateTotalPrice() + 40} ${s.currencyEgp}',
                style: TextStyles.bold16,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
