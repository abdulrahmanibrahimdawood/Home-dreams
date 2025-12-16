import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_dreams/core/cubits/products_cubit/cubit/products_cubit.dart';
import 'package:home_dreams/core/repos/products_repo/product_repo.dart';
import 'package:home_dreams/core/services/get_it_services.dart';
import 'package:home_dreams/core/widgets/build_app_bar.dart' show buildAppBar;
import 'package:home_dreams/features/best_selling_product/presentation/views/widgets/best_selling_view_body.dart';
import 'package:home_dreams/features/home/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:home_dreams/features/home/presentation/manager/cart_item_cubit/cart_item_cubit.dart';

class BestSellingView extends StatelessWidget {
  const BestSellingView({super.key});
  static const routeName = 'best_selling_view';
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              ProductsCubit(getIt.get<ProductsRepo>())
                ..getBestSellingProducts(),
        ),
        BlocProvider(create: (context) => CartCubit()),
        BlocProvider(create: (context) => CartItemCubit()),
      ],
      child: Scaffold(
        appBar: buildAppBar(context),
        body: BestSellingViewBody(),
      ),
    );
  }
}
