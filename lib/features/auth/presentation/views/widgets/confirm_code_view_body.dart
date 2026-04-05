import 'package:flutter/material.dart';
import 'package:home_dreams/constants.dart';
import 'package:home_dreams/core/utils/app_text_styles.dart';
import 'package:home_dreams/core/widgets/custom_button.dart';
import 'package:home_dreams/core/widgets/custom_text_form_field.dart';
import 'package:home_dreams/features/auth/presentation/views/new_password_view.dart';
import 'package:home_dreams/generated/l10n.dart';

class ConfirmCodeViewBody extends StatelessWidget {
  const ConfirmCodeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          SizedBox(height: 24),
          Text(
            '${s.confirmCodeEmailIntro}\nMaxxx@email.com',
            textAlign: TextAlign.right,
            style: TextStyles.semiBold16.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          SizedBox(height: 30),
          CustomTextFormField(
            errorMessage: s.verificationCodeRequired,
            hintText: s.verificationCodeHint,
            textInputType: TextInputType.number,
          ),
          SizedBox(height: 30),
          CustomButton(
            onPressed: () {
              Navigator.pushNamed(context, NewPasswordView.routeName);
            },
            text: s.verifyCode,
          ),
          SizedBox(height: 30),
          GestureDetector(
            onTap: () {},
            child: Text(
              s.resendCode,
              textAlign: TextAlign.center,
              style: TextStyles.semiBold16.copyWith(
                color: Theme.of(context).colorScheme.primaryContainer,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
