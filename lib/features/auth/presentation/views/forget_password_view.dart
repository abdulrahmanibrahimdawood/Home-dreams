import 'package:flutter/material.dart';
import 'package:home_dreams/core/services/data_service.dart';
import 'package:home_dreams/core/services/firebase_auth_service.dart';
import 'package:home_dreams/core/services/get_it_services.dart';
import 'package:home_dreams/core/widgets/custom_app_bar_inside.dart';
import 'package:home_dreams/features/auth/data/repos/auth_repo_impl.dart';
import 'package:home_dreams/features/auth/presentation/views/widgets/forget_password_view_body.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});
  static const String routeName = 'forget password';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBarInside(
        context,
        title: 'نسيان كلمة المرور',
        showNotification: false,
      ),
      body: ForgetPasswordViewBody(
        authRepo: AuthRepoImpl(
          firebaseAuthService: getIt<FirebaseAuthService>(),
          databaseServices: getIt<DatabaseServices>(),
        ),
      ),
    );
  }
}
