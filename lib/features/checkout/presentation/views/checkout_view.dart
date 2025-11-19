import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_dreams/core/helper_funcations/get_user.dart';
import 'package:home_dreams/core/repos/order_repo/order_repo.dart';
import 'package:home_dreams/core/services/get_it_services.dart';
import 'package:home_dreams/core/widgets/custom_app_bar_inside.dart';
import 'package:home_dreams/features/checkout/domain/entites/order_input_entity.dart';
import 'package:home_dreams/features/checkout/domain/entites/shipping_address_entity.dart';
import 'package:home_dreams/features/checkout/presentation/manager/add_order_cubit/add_order_cubit.dart';
import 'package:home_dreams/features/checkout/presentation/views/widgets/add_order_cubit_bloc_builder.dart';
import 'package:home_dreams/features/checkout/presentation/views/widgets/checkout_view_body.dart';
import 'package:home_dreams/features/home/domain/entites/cart_entity.dart';
import 'package:provider/provider.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key, required this.cartEntity});
  static const routeName = 'checkout';
  final CartEntity cartEntity;

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  late OrderInputEntity orderEntity;
  @override
  void initState() {
    orderEntity = OrderInputEntity(
      uId: getUser().uId,
      widget.cartEntity,
      shippingAddressEntity: ShippingAddressEntity(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddOrderCubit(getIt.get<OrderRepo>()),
      child: Scaffold(
        appBar: buildAppBarInside(
          context,
          title: 'الشحن',
          showNotification: false,
        ),
        body: Provider.value(
          value: orderEntity,
          child: AddOrderCubitBlocBuilder(child: const CheckoutViewBody()),
        ),
      ),
    );
  }
}
