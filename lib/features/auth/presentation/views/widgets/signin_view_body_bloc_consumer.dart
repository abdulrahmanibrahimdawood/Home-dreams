import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_dreams/core/helper_funcations/build_error_bar.dart'
    show showErrorBar;
import 'package:home_dreams/core/widgets/custom_progress_hud.dart';
import 'package:home_dreams/features/auth/presentation/managers/signin_cubit/signin_cubit.dart';
import 'package:home_dreams/features/auth/presentation/views/widgets/signin_view_body.dart';
import 'package:home_dreams/features/home/presentation/views/main_view.dart';

class SigninViewBodyBlocConsumer extends StatelessWidget {
  const SigninViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SigninCubit, SigninState>(
      listener: (context, state) {
        if (state is SigninSuccess) {
          Navigator.pushNamed(context, MainView.routeName);
        }
        if (state is SigninFailure) {
          showErrorBar(context, state.message);
        }
      },
      builder: (context, state) {
        return CustomProgressHUD(
          isLoading: state is SigninLoading ? true : false,
          child: SigninViewBody(),
        );
      },
    );
  }
}
