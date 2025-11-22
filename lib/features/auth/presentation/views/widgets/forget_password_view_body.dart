import 'package:flutter/material.dart';
import 'package:home_dreams/constants.dart';
import 'package:home_dreams/core/utils/app_text_styles.dart';
import 'package:home_dreams/core/widgets/custom_button.dart';
import 'package:home_dreams/core/widgets/custom_text_form_field.dart';
import 'package:home_dreams/features/auth/presentation/views/confirm_code_view.dart';

class ForgetPasswordViewBody extends StatelessWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 24),
          Text(
            'لا تقلق ، ما عليك سوى كتابة بريدك الالكتروني وسنرسل لك رمز التحقق.',
            textAlign: TextAlign.right,
            style: TextStyles.semiBold16.copyWith(color: Color(0xFF616A6B)),
          ),
          SizedBox(height: 30),
          CustomTextFormField(
            hintText: 'البريد الإلكتروني',
            textInputType: TextInputType.emailAddress,
          ),
          SizedBox(height: 30),
          CustomButton(
            onPressed: () {
              Navigator.pushNamed(context, ConfirmCodeView.routeName);
            },
            text: 'ارسل رمز التحقق',
          ),
        ],
      ),
    );
  }
}
