import 'package:flutter/material.dart';
import 'package:home_dreams/core/widgets/custom_text_form_field.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({
    super.key,
    this.onSaved,
    this.hintText,
    this.errorMessage,
    this.validate = true,
    this.controller,
  });
  final void Function(String?)? onSaved;
  final String? hintText;
  final String? errorMessage;
  final TextEditingController? controller;

  final bool validate;
  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: widget.controller,
      validate: widget.validate,
      errorMessage: widget.errorMessage ?? 'يرجى كتابة كلمة المرور',
      obscureText: obscureText,
      onSaved: widget.onSaved,
      suffixIcon: GestureDetector(
        onTap: () {
          obscureText = !obscureText;
          setState(() {});
        },
        child: obscureText
            ? Icon(Icons.remove_red_eye, color: Color(0xffC9CECF))
            : Icon(Icons.visibility_off, color: Color(0xffC9CECF)),
      ),
      hintText: widget.hintText ?? 'كلمة المرور',
      textInputType: TextInputType.emailAddress,
    );
  }
}
