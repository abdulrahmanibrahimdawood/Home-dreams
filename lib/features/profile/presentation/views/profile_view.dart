import 'package:flutter/material.dart';
import 'package:home_dreams/core/widgets/custom_app_bar_inside.dart';
import 'package:home_dreams/features/profile/presentation/views/widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});
  static const routeName = 'profile';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBarInside(
        context,
        title: 'حسابي',
        showNotification: false,
        showBackButton: false,
      ),
      body: const ProfileViewBody(),
    );
  }
}
