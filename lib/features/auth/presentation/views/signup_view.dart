import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_dreams/core/services/get_it_services.dart';
import 'package:home_dreams/core/widgets/custom_app_bar.dart';
import 'package:home_dreams/features/auth/domain/repos/auth_repo.dart';
import 'package:home_dreams/features/auth/presentation/managers/signup_cubit/signup_cubit.dart';
import 'package:home_dreams/features/auth/presentation/views/widgets/signup_view_body_bloc_consumer.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});
  static const routeName = 'signup';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(getIt<AuthRepo>()),
      child: Scaffold(
        appBar: buildAppBar(context, text: 'حساب جديد'),
        body: SignupViewBodyBlocConsumer(),
      ),
    );
  }
}
