import 'package:flutter/material.dart';
import 'package:home_dreams/constants.dart';
import 'package:home_dreams/core/helper_funcations/get_user.dart';
import 'package:home_dreams/core/utils/app_images.dart';
import 'package:home_dreams/core/utils/app_text_styles.dart';
import 'package:home_dreams/core/widgets/custom_button.dart';
import 'package:home_dreams/core/widgets/custom_password_field.dart';
import 'package:home_dreams/core/widgets/custom_text_form_field.dart';

class EditProfileViewBody extends StatelessWidget {
  const EditProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: Column(
          children: [
            SizedBox(height: 24),
            Align(
              alignment: Alignment.topRight,
              child: Text('المعلومات الشخصيه', style: TextStyles.semiBold13),
            ),
            SizedBox(height: 8),
            CustomTextFormField(
              hintText: getUser().name,
              textInputType: TextInputType.name,
              suffixIcon: Image.asset(Assets.assetsImagesEdit),
            ),
            SizedBox(height: 8),
            CustomTextFormField(
              hintText: getUser().email,
              textInputType: TextInputType.name,
              suffixIcon: Image.asset(Assets.assetsImagesEdit),
            ),
            SizedBox(height: 16),
            Align(
              alignment: Alignment.topRight,
              child: Text('تغيير كلمة المرور', style: TextStyles.semiBold13),
            ),
            SizedBox(height: 8),
            PasswordField(hintText: 'كلمة المرور الحالية'),
            SizedBox(height: 8),
            PasswordField(hintText: 'كلمة المرور الجديدة'),
            SizedBox(height: 16),
            PasswordField(hintText: 'تأكيد كلمة المرور الجديدة'),
            SizedBox(height: 74),
            CustomButton(text: 'حفظ التغيرات', onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
