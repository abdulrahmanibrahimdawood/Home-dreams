import 'package:flutter/material.dart';
import 'package:home_dreams/core/repos/products_repo/product_repo_impl.dart';
import 'package:home_dreams/features/search/presentation/views/widgets/filter_modal_bottom_sheet.dart';

Future<FilterParams?> filterWith(BuildContext context) async {
  FilterParams? filter;
  final sort = await showFilterBottomSheet(context);
  if (sort != null) {
    if (sort == 'lowToHigh') {
      filter = FilterParams(sortBy: SortBy.priceLowToHigh);
    } else if (sort == 'highToLow') {
      filter = FilterParams(sortBy: SortBy.priceHighToLow);
    }
  }
  return filter;
}
