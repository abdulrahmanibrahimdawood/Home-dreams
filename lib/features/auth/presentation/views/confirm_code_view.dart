import 'package:flutter/material.dart';
import 'package:home_dreams/core/widgets/custom_app_bar_inside.dart';
import 'package:home_dreams/features/auth/presentation/views/widgets/confirm_code_view_body.dart';

class ConfirmCodeView extends StatelessWidget {
  const ConfirmCodeView({super.key});
  static const String routeName = 'confirm code view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBarInside(
        context,
        title: 'تحقق من الرمز',
        showNotification: false,
      ),
      body: const ConfirmCodeViewBody(),
    );
  }
}
