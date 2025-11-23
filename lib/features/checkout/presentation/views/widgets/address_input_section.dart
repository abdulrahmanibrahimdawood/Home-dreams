import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_dreams/core/widgets/custom_text_form_field.dart';
import 'package:home_dreams/features/checkout/domain/entites/order_input_entity.dart';

class AddressInputSection extends StatelessWidget {
  const AddressInputSection({
    super.key,
    required this.formKey,
    required this.valueListenable,
  });
  final GlobalKey<FormState> formKey;
  final ValueListenable<AutovalidateMode> valueListenable;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ValueListenableBuilder<AutovalidateMode>(
        valueListenable: valueListenable,
        builder: (context, value, child) => Form(
          key: formKey,
          autovalidateMode: value,
          child: Column(
            children: [
              SizedBox(height: 24),
              CustomTextFormField(
                errorMessage: 'يرجى كتابة الاسم كامل',
                onSaved: (value) {
                  context.read<OrderInputEntity>().shippingAddressEntity.name =
                      value!;
                },
                hintText: 'الاسم كامل',
                textInputType: TextInputType.text,
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                errorMessage: 'يرجى كتابة البريد الإلكتروني',
                onSaved: (value) {
                  context.read<OrderInputEntity>().shippingAddressEntity.email =
                      value!;
                },
                hintText: 'البريد الإلكتروني',
                textInputType: TextInputType.text,
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                errorMessage: 'يرجى كتابة العنوان',
                onSaved: (value) {
                  context
                          .read<OrderInputEntity>()
                          .shippingAddressEntity
                          .address =
                      value!;
                },
                hintText: 'العنوان',
                textInputType: TextInputType.text,
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                errorMessage: 'يرجى كتابة المدينه',
                onSaved: (value) {
                  context.read<OrderInputEntity>().shippingAddressEntity.city =
                      value!;
                },
                hintText: 'المدينه',
                textInputType: TextInputType.text,
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                errorMessage: 'يرجى كتابة رقم الطابق , رقم الشقه ..',
                onSaved: (value) {
                  context.read<OrderInputEntity>().shippingAddressEntity.floor =
                      value!;
                },
                hintText: 'رقم الطابق , رقم الشقه ..',
                textInputType: TextInputType.text,
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                errorMessage: 'يرجى كتابة رقم التليفون',
                onSaved: (value) {
                  context.read<OrderInputEntity>().shippingAddressEntity.phone =
                      value!;
                },
                hintText: 'رقم التليفون',
                textInputType: TextInputType.number,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
