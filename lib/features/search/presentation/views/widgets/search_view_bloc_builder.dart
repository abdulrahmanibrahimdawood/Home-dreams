import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_dreams/core/cubits/products_cubit/cubit/products_cubit.dart';

class SearchViewBlocBuilder extends StatelessWidget {
  const SearchViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsSuccess && state.products.isNotEmpty) {
          return Row(
            children: [
              Text(
                'نتايج البحث',
                style: TextStyle(fontSize: 13, color: Color(0xFF949D9E)),
              ),
            ],
          );
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }
}
