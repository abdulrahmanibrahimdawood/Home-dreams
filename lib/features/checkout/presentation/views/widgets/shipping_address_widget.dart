import 'package:flutter/material.dart';
import 'package:home_dreams/core/utils/app_images.dart';
import 'package:home_dreams/features/checkout/domain/entites/order_input_entity.dart';
import 'package:home_dreams/features/checkout/presentation/views/widgets/payment_item.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utils/app_text_styles.dart';

class ShippingAddressWidget extends StatelessWidget {
  const ShippingAddressWidget({super.key, required this.pageController});
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return PaymentItem(
      title: 'عنوان التوصيل',
      child: Row(
        children: [
          Image.asset(Assets.assetsImagesLocation),
          const SizedBox(width: 8),
          Text(
            context.read<OrderInputEntity>().shippingAddressEntity.toString(),
            textAlign: TextAlign.right,
            style: TextStyles.regular13.copyWith(
              color: const Color(0xFF4E5556),
            ),
          ),
          const Spacer(),
          SizedBox(
            child: GestureDetector(
              onTap: () {
                pageController.animateToPage(
                  pageController.page!.toInt() - 1,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                );
              },
              child: Row(
                children: [
                  Image.asset(Assets.assetsImagesEdit),
                  const SizedBox(width: 4),
                  Text(
                    'تعديل',
                    style: TextStyles.semiBold13.copyWith(
                      color: const Color(0xFF949D9E),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
