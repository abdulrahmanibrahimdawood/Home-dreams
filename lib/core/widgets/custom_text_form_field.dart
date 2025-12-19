import 'package:flutter/material.dart';
import 'package:home_dreams/core/utils/app_text_styles.dart';

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
  });
  final String hintText;
  final TextInputType textInputType;
  final Widget? suffixIcon;
  final void Function(String?)? onSaved;
  final bool obscureText;
  final String? errorMessage;
  final bool validate;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      onSaved: onSaved,
      validator: (value) {
        if (validate == true) {
          if (value == null || value.isEmpty) {
            return errorMessage ?? 'يرجى كتابة هذا الحقل';
          }
          return null;
        }
        return null;
      },

      keyboardType: textInputType,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        hintStyle: TextStyles.bold13.copyWith(color: Color(0xff949D9E)),
        hintText: hintText,
        filled: true,
        fillColor: Color.fromARGB(255, 243, 241, 241),
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
      ),
    );
  }
}

OutlineInputBorder buildBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(4),
    borderSide: BorderSide(color: Color(0xffE6E9E9), width: 1),
  );
}
