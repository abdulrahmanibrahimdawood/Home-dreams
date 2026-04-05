import 'package:flutter/material.dart';
import 'package:home_dreams/core/utils/app_text_styles.dart';
import 'package:home_dreams/generated/l10n.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.textInputType,
    this.suffixIcon,
    this.onSaved,
    this.obscureText = false,
    this.errorMessage,
    this.validate = true,
    this.initialValue,
    this.controller,
    this.customValidator,
  });

  final String hintText;
  final String? initialValue;
  final TextInputType textInputType;
  final Widget? suffixIcon;
  final void Function(String?)? onSaved;
  final bool obscureText;
  final String? errorMessage;
  final TextEditingController? controller;
  final bool validate;
  final String? Function(String?)? customValidator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      initialValue: initialValue,
      obscureText: obscureText,
      onSaved: onSaved,
      validator: (value) {
        if (customValidator != null) {
          return customValidator!(value);
        }

        if (validate == true) {
          if (value == null || value.isEmpty) {
            return errorMessage ?? S.current.fieldRequired;
          }
        }
        return null;
      },
      keyboardType: textInputType,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        hintStyle: TextStyles.bold13.copyWith(
          color: Theme.of(context).colorScheme.onSurfaceVariant,
        ),
        hintText: hintText,
        filled: true,
        fillColor: Theme.of(context).colorScheme.surfaceContainer,
        border: buildBorder(context),
        enabledBorder: buildBorder(context),
        focusedBorder: buildBorder(context),
      ),
    );
  }
}

OutlineInputBorder buildBorder(BuildContext context) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(4),
    borderSide: BorderSide(
      color: Theme.of(context).colorScheme.outline,
      width: 1,
    ),
  );
}
