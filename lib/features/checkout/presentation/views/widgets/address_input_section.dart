import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_dreams/core/widgets/custom_text_form_field.dart';
import 'package:home_dreams/features/checkout/domain/entites/order_input_entity.dart';
import 'package:home_dreams/generated/l10n.dart';

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
        builder: (context, value, child) {
          final s = S.of(context);
          return Form(
          key: formKey,
          autovalidateMode: value,
          child: Column(
            children: [
              SizedBox(height: 24),
              CustomTextFormField(
                errorMessage: s.nameRequired,
                onSaved: (value) {
                  context.read<OrderInputEntity>().shippingAddressEntity.name =
                      value!;
                },
                hintText: s.addressFullNameHint,
                textInputType: TextInputType.text,
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                errorMessage: s.emailRequired,
                onSaved: (value) {
                  context.read<OrderInputEntity>().shippingAddressEntity.email =
                      value!;
                },
                hintText: s.emailHint,
                textInputType: TextInputType.text,
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                errorMessage: s.addressRequired,
                onSaved: (value) {
                  context
                          .read<OrderInputEntity>()
                          .shippingAddressEntity
                          .address =
                      value!;
                },
                hintText: s.addressHint,
                textInputType: TextInputType.text,
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                errorMessage: s.cityRequired,
                onSaved: (value) {
                  context.read<OrderInputEntity>().shippingAddressEntity.city =
                      value!;
                },
                hintText: s.cityHint,
                textInputType: TextInputType.text,
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                errorMessage: s.floorApartmentRequired,
                onSaved: (value) {
                  context.read<OrderInputEntity>().shippingAddressEntity.floor =
                      value!;
                },
                hintText: s.floorApartmentHint,
                textInputType: TextInputType.text,
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                errorMessage: s.phoneRequired,
                onSaved: (value) {
                  context.read<OrderInputEntity>().shippingAddressEntity.phone =
                      value!;
                },
                hintText: s.phoneHint,
                textInputType: TextInputType.number,
              ),
            ],
          ),
        );
        },
      ),
    );
  }
}
