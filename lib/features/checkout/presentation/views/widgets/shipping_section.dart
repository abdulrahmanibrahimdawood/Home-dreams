import 'package:flutter/material.dart';
import 'package:home_dreams/features/checkout/domain/entites/order_input_entity.dart';
import 'package:home_dreams/features/checkout/presentation/views/widgets/shipping_item.dart';
import 'package:provider/provider.dart';

class ShippingSection extends StatefulWidget {
  const ShippingSection({super.key});

  @override
  State<ShippingSection> createState() => _ShippingSectionState();
}

class _ShippingSectionState extends State<ShippingSection>
    with AutomaticKeepAliveClientMixin {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    var orderEntity = context.read<OrderInputEntity>();
    return Column(
      children: [
        SizedBox(height: 33),
        ShippingItem(
          onTap: () {
            orderEntity.payWithCash = true;
            selectedIndex = 0;
            setState(() {});
          },
          isSelected: selectedIndex == 0,
          title: 'الدفع عند الاستلام',
          subTitle: 'التسليم من المكان',
          price: (orderEntity.cartEntity.calculateTotalPrice() + 50).toString(),
        ),
        SizedBox(height: 16),
        ShippingItem(
          onTap: () {
            orderEntity.payWithCash = false;
            selectedIndex = 1;
            setState(() {});
          },
          isSelected: selectedIndex == 1,
          title: 'الدفع اونلاين',
          subTitle: 'يرجي تحديد طريقه الدفع',
          price: orderEntity.cartEntity.calculateTotalPrice().toString(),
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}

@override
bool get wantKeepAlive => true;
