import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_dreams/core/helper_funcations/build_error_bar.dart';
import 'package:home_dreams/features/search/presentation/manager/cubit/search_product_cubit.dart';
import 'package:home_dreams/features/search/presentation/views/widgets/search_view_body.dart';

class SearchViewBodyBlocConsumer extends StatelessWidget {
  const SearchViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchProductCubit, SearchProductState>(
      listener: (context, state) {
        if (state is SearchProductFailure) {
          showBar(context, state.errMessage);
        }
      },
      builder: (context, state) {
        if (state is SearchProductFailure) {
          return const Center(child: Text('هناك خطأ ما'));
        } else if (state is SearchProductSuccess) {
          return state.products.isEmpty
              ? Center(child: Text('لا يوجد منتجات'))
              : SearchViewBody();
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
