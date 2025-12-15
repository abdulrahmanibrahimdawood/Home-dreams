import 'package:flutter/material.dart';
import 'package:home_dreams/core/utils/app_text_styles.dart';

class ProductsViewHeader extends StatelessWidget {
  const ProductsViewHeader({super.key, required this.productsLength});
  final int productsLength;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [Text('$productsLength نتائج', style: TextStyles.bold16)],
    );
  }
}
