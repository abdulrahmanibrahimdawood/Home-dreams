import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_dreams/core/services/get_it_services.dart';
import 'package:home_dreams/core/widgets/custom_app_bar.dart';
import 'package:home_dreams/features/auth/domain/repos/auth_repo.dart';
import 'package:home_dreams/features/auth/presentation/managers/signin_cubit/signin_cubit.dart';
import 'package:home_dreams/features/auth/presentation/views/widgets/signin_view_body_bloc_consumer.dart';

class SigninView extends StatelessWidget {
  const SigninView({super.key});
  static const routeName = 'login';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SigninCubit(getIt.get<AuthRepo>()),
      child: Scaffold(
        appBar: buildAppBar(context, text: 'تسجيل الدخول'),
        body: SigninViewBodyBlocConsumer(),
      ),
    );
  }
}
