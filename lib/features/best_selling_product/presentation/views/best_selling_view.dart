import 'package:flutter/material.dart';
import 'package:home_dreams/core/widgets/build_app_bar.dart' show buildAppBar;
import 'package:home_dreams/features/best_selling_product/presentation/views/widgets/best_selling_view_body.dart';

class BestSellingView extends StatelessWidget {
  const BestSellingView({super.key});
  static const routeName = 'best_selling_view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: buildAppBar(context), body: BestSellingViewBody());
  }
}
