import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_dreams/core/utils/app_text_styles.dart';
import 'package:home_dreams/features/search/presentation/manager/get_search_keyword_cubit/get_search_keyword_cubit.dart';
import 'package:home_dreams/features/search/presentation/manager/manage_keywords_cubit/manage_keywords_cubit.dart';
import 'package:home_dreams/generated/l10n.dart';

class SearchKeywordHeader extends StatelessWidget {
  const SearchKeywordHeader({super.key, required this.onClearAll});
  final VoidCallback onClearAll;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          S.of(context).recentSearches,
          style: TextStyles.semiBold13.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        const Spacer(),
        InkWell(
          onTap: () {
            context.read<ManageKeywordsCubit>().clearKeywords().then((_) {
              context.read<GetSearchKeywordCubit>().getSearchKeyWords();
              onClearAll();
            });
          },
          child: Text(
            S.of(context).deleteAll,
            style: TextStyles.semiBold13.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
        ),
      ],
    );
  }
}
