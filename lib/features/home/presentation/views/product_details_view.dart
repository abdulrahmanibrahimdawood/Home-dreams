import 'package:flutter/material.dart';
import 'package:home_dreams/core/entities/product_entity.dart';
import 'package:home_dreams/features/home/presentation/views/widgets/product_details_view_body.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key, required this.productEntity});
  static const String routeName = '/product_details';
  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ProductDetailsViewBody(productEntity: productEntity),
      ),
    );
  }
}
