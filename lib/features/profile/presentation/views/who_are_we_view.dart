import 'package:flutter/material.dart';
import 'package:home_dreams/core/widgets/custom_app_bar_inside.dart';
import 'package:home_dreams/features/profile/presentation/views/widgets/who_are_we_view_body.dart';

class WhoAreWeView extends StatelessWidget {
  const WhoAreWeView({super.key});
  static const routeName = 'who are we view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBarInside(
        context,
        title: 'من نحن',
        showNotification: false,
      ),
      body: const WhoAreWeViewBody(),
    );
  }
}
