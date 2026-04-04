import 'package:flutter/material.dart';
import 'package:home_dreams/core/widgets/custom_app_bar_inside.dart';
import 'package:home_dreams/features/favorites/presentation/views/widgets/favorites_view_body.dart';
import 'package:home_dreams/generated/l10n.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});
  static const routeName = 'favorites';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBarInside(
        context,
        title: S.of(context).favorites,
        showNotification: false,
      ),
      body: const FavoritesViewBody(),
    );
  }
}
