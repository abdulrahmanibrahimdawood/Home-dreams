import 'package:flutter/material.dart';
import 'package:home_dreams/constants.dart';
import 'package:home_dreams/core/helper_funcations/build_error_bar.dart';
import 'package:home_dreams/core/helper_funcations/get_user.dart';
import 'package:home_dreams/core/utils/app_text_styles.dart';
import 'package:home_dreams/core/widgets/custom_button.dart';
import 'package:home_dreams/core/widgets/custom_text_form_field.dart';
import 'package:home_dreams/features/auth/domain/repos/auth_repo.dart';

class ForgetPasswordViewBody extends StatefulWidget {
  const ForgetPasswordViewBody({super.key, required this.authRepo});
  final AuthRepo authRepo;
  @override
  State<ForgetPasswordViewBody> createState() => _ForgetPasswordViewBodyState();
}

class _ForgetPasswordViewBodyState extends State<ForgetPasswordViewBody> {
  late String email;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
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
              onSaved: (value) {
                email = value!;
              },
              errorMessage: 'يرجى كتابة البريد الإلكتروني',
              hintText: 'البريد الإلكتروني',
              textInputType: TextInputType.emailAddress,
            ),
            SizedBox(height: 30),
            CustomButton(
              onPressed: () async {
                if (!formKey.currentState!.validate()) {
                  setState(() {
                    autovalidateMode = AutovalidateMode.always;
                  });
                  return;
                }
                formKey.currentState!.save();
                final inputEmail = email;
                final userEmail = getUser().email;
                if (inputEmail != userEmail) {
                  showBar(context, 'البريد الإلكتروني غير صحيح');
                  return;
                }
                try {
                  await widget.authRepo.resetPassword(email: inputEmail);
                  if (!mounted) return;
                  showBar(context, 'تم إرسال رابط إعادة تعيين كلمة المرور');
                } catch (e) {
                  if (!mounted) return;
                  showBar(context, 'حدث خطأ أثناء الإرسال');
                }
              },
              text: 'ارسل رمز التحقق',
            ),
          ],
        ),
      ),
    );
  }
}
