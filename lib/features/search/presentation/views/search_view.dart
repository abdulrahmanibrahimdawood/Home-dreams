import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_dreams/core/services/get_it_services.dart';
import 'package:home_dreams/core/widgets/custom_app_bar_inside.dart';
import 'package:home_dreams/features/search/data/data_sources/search_local_data_source.dart';
import 'package:home_dreams/features/search/domain/repo/search_repo.dart';
import 'package:home_dreams/features/search/presentation/manager/cubit/search_product_cubit.dart';
import 'package:home_dreams/features/search/presentation/views/widgets/search_view_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});
  static const routeName = 'search';
  @override
  Widget build(BuildContext context) {
    log('${SearchHistoryService.getHistory()}');

    return BlocProvider(
      create: (context) => SearchProductCubit(getIt.get<SearchRepo>()),
      child: Scaffold(
        appBar: buildAppBarInside(context, title: 'بحث'),
        body: SearchViewBody(),
      ),
    );
  }
}
