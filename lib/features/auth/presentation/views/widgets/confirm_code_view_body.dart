import 'package:flutter/material.dart';
import 'package:home_dreams/constants.dart';
import 'package:home_dreams/core/utils/app_colors.dart';
import 'package:home_dreams/core/utils/app_text_styles.dart';
import 'package:home_dreams/core/widgets/custom_button.dart';
import 'package:home_dreams/core/widgets/custom_text_form_field.dart';

class ConfirmCodeViewBody extends StatelessWidget {
  const ConfirmCodeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 24),
          Text(
            'أدخل الرمز الذي أرسلناه إلى عنوان بريد التالي Maxxx@email.com',
            textAlign: TextAlign.right,
            style: TextStyles.semiBold16.copyWith(color: Color(0xFF616A6B)),
          ),
          SizedBox(height: 30),
          CustomTextFormField(
            hintText: 'كود التحقق',
            textInputType: TextInputType.number,
          ),
          SizedBox(height: 30),
          CustomButton(onPressed: () {}, text: 'تحقق من الرمز'),
          SizedBox(height: 30),
          GestureDetector(
            onTap: () {},
            child: Text(
              'إعادة إرسال الرمز',
              textAlign: TextAlign.center,
              style: TextStyles.semiBold16.copyWith(
                color: AppColors.lightPrimaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
