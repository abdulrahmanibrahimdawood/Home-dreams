import 'package:flutter/material.dart';
import 'package:home_dreams/features/checkout/presentation/views/widgets/order_summary_widget.dart';
import 'package:home_dreams/features/checkout/presentation/views/widgets/shipping_address_widget.dart';

class PaymentSection extends StatelessWidget {
  const PaymentSection({super.key, required this.pageController});
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 24),
        OrderSummaryWidget(pageController: pageController),
        SizedBox(height: 16),
        ShippingAddressWidget(pageController: pageController),
      ],
    );
  }
}
