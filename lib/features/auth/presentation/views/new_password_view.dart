import 'package:flutter/material.dart';
import 'package:home_dreams/core/widgets/custom_app_bar_inside.dart';
import 'package:home_dreams/features/auth/presentation/views/widgets/new_password_view_body.dart';
import 'package:home_dreams/generated/l10n.dart';

class NewPasswordView extends StatelessWidget {
  const NewPasswordView({super.key});
  static const routeName = 'new password';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBarInside(
        context,
        title: S.of(context).newPasswordTitle,
        showNotification: false,
      ),
      body: const NewPasswordViewBody(),
    );
  }
}
