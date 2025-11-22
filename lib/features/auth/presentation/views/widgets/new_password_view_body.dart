import 'package:flutter/material.dart';
import 'package:home_dreams/constants.dart';
import 'package:home_dreams/core/utils/app_text_styles.dart';
import 'package:home_dreams/core/widgets/custom_button.dart';
import 'package:home_dreams/core/widgets/custom_password_field.dart';
import 'package:home_dreams/features/auth/presentation/views/widgets/change_password_success_dialog.dart';

class NewPasswordViewBody extends StatelessWidget {
  const NewPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 24),
          Text(
            'قم بإنشاء كلمة مرور جديدة لتسجيل الدخول',
            textAlign: TextAlign.right,
            style: TextStyles.semiBold16.copyWith(color: Colors.black),
          ),
          SizedBox(height: 30),
          PasswordField(),
          SizedBox(height: 24),
          PasswordField(hintText: 'تأكيد كلمة المرور'),
          SizedBox(height: 30),
          CustomButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => const SuccessDialog(),
              );
            },
            text: 'إنشاء كلمة مرور جديدة',
          ),
        ],
      ),
    );
  }
}
