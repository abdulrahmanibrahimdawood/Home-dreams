import 'package:flutter/material.dart';
import 'package:home_dreams/core/utils/app_text_styles.dart';
import 'package:home_dreams/features/best_selling_product/presentation/views/best_selling_view.dart';

class BestSellingHeader extends StatelessWidget {
  const BestSellingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text('الأكثر مبيعًا', style: TextStyles.bold16),
        const Spacer(),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, BestSellingView.routeName);
          },
          child: Text(
            'المزيد',
            style: TextStyles.regular13.copyWith(color: Color(0xff949D9E)),
          ),
        ),
      ],
    );
  }
}
