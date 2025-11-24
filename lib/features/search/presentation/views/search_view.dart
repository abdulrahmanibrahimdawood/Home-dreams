import 'package:flutter/material.dart';
import 'package:home_dreams/core/widgets/custom_app_bar_inside.dart';
import 'package:home_dreams/features/search/presentation/views/widgets/search_view_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});
  static const routeName = 'search';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBarInside(context, title: 'بحث'),
      body: const SearchViewBody(),
    );
  }
}
