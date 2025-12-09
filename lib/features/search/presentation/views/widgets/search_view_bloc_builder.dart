import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_dreams/features/search/presentation/manager/search_product_cubit/search_product_cubit.dart';

class SearchViewBlocBuilder extends StatelessWidget {
  const SearchViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchProductCubit, SearchProductState>(
      builder: (context, state) {
        if (state is SearchProductSuccess && state.products.isNotEmpty) {
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
