import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_dreams/core/utils/app_text_styles.dart';
import 'package:home_dreams/features/checkout/domain/entites/order_input_entity.dart';
import 'package:home_dreams/features/checkout/presentation/views/widgets/payment_item.dart';

class OrderSummaryWidget extends StatelessWidget {
  const OrderSummaryWidget({super.key, required this.pageController});
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return PaymentItem(
      title: 'ملخص الطلب',
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'المجموع الفرعي :',
                style: TextStyles.regular13.copyWith(color: Color(0xff4E5556)),
              ),
              Spacer(),
              Text(
                '${context.read<OrderInputEntity>().cartEntity.calculateTotalPrice()} جنيه',
                style: TextStyles.semiBold16,
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Text(
                'التوصيل  :',
                style: TextStyles.regular13.copyWith(color: Color(0xff4E5556)),
              ),
              Spacer(),
              Text(
                '40 جنيه',
                style: TextStyles.regular13.copyWith(color: Color(0xff4E5556)),
              ),
            ],
          ),
          SizedBox(height: 9),
          Divider(thickness: 0.6, color: Color(0xffCACACE)),
          SizedBox(height: 9),
          Row(
            children: [
              Text('الكلي', style: TextStyles.bold16),
              Spacer(),
              Text(
                '${context.read<OrderInputEntity>().cartEntity.calculateTotalPrice() + 40} جنيه',
                style: TextStyles.bold16,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
