import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_dreams/core/helper_funcations/build_error_bar.dart';
import 'package:home_dreams/features/home/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:home_dreams/features/home/presentation/views/widgets/main_view_body.dart';
import 'package:home_dreams/generated/l10n.dart';

class MainViewBodyBlocConsumer extends StatelessWidget {
  const MainViewBodyBlocConsumer({super.key, required this.currentViewIndex});

  final int currentViewIndex;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit, CartState>(
      listener: (context, state) {
        if (state is CartItemAdded) {
          showBar(context, S.of(context).productAddedSuccess);
        }
        if (state is CartItemRemoved) {
          showBar(context, S.of(context).productRemovedSuccess);
        }
      },
      child: MainViewBody(currentViewIndex: currentViewIndex),
    );
  }
}
