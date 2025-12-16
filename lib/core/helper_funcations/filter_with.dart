import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_dreams/core/cubits/products_cubit/cubit/products_cubit.dart';
import 'package:home_dreams/core/repos/products_repo/product_repo_impl.dart';
import 'package:home_dreams/features/search/presentation/views/widgets/filter_modal_bottom_sheet.dart';

Future<String?> filterWith({
  required BuildContext context,
  required String? lastSelectedSort,
}) async {
  final sort = await showFilterBottomSheet(
    context,
    initialValue: lastSelectedSort ?? '',
  );

  if (sort == null) return lastSelectedSort;

  FilterParams filter;
  if (sort == 'lowToHigh') {
    filter = FilterParams(sortBy: SortBy.priceLowToHigh);
  } else if (sort == 'highToLow') {
    filter = FilterParams(sortBy: SortBy.priceHighToLow);
  } else {
    filter = FilterParams(sortBy: SortBy.reset);
  }

  context.read<ProductsCubit>().getProducts(filter: filter);

  return sort == 'reset' ? null : sort;
}
