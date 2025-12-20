import 'package:flutter/material.dart';
import 'package:home_dreams/constants.dart';
import 'package:home_dreams/core/helper_funcations/get_user.dart';
import 'package:home_dreams/core/utils/app_images.dart';
import 'package:home_dreams/core/utils/app_text_styles.dart';
import 'package:home_dreams/core/widgets/custom_button.dart';
import 'package:home_dreams/core/widgets/custom_password_field.dart';
import 'package:home_dreams/core/widgets/custom_text_form_field.dart';
import 'package:home_dreams/features/profile/domain/repos/update_user_data_repo.dart';

class EditProfileViewBody extends StatefulWidget {
  const EditProfileViewBody({super.key, required this.updateUserDataRepo});
  final UpdateUserDataRepo updateUserDataRepo;
  @override
  State<EditProfileViewBody> createState() => _EditProfileViewBodyState();
}

class _EditProfileViewBodyState extends State<EditProfileViewBody> {
  late String email, name, currentPassword, newPassword, confirmPassword;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              SizedBox(height: 24),
              Align(
                alignment: Alignment.topRight,
                child: Text('المعلومات الشخصيه', style: TextStyles.semiBold13),
              ),
              SizedBox(height: 8),
              CustomTextFormField(
                onSaved: (value) {
                  name = value!;
                },
                validate: false,
                hintText: getUser().name,
                textInputType: TextInputType.name,
                suffixIcon: Image.asset(Assets.assetsImagesEdit),
              ),
              SizedBox(height: 8),
              CustomTextFormField(
                validate: false,
                hintText: getUser().email,
                textInputType: TextInputType.emailAddress,
                suffixIcon: Image.asset(Assets.assetsImagesEdit),
              ),
              SizedBox(height: 16),
              Align(
                alignment: Alignment.topRight,
                child: Text('تغيير كلمة المرور', style: TextStyles.semiBold13),
              ),
              SizedBox(height: 8),
              PasswordField(
                onSaved: (value) {
                  currentPassword = value!;
                },
                hintText: 'كلمة المرور الحالية',
                validate: false,
                errorMessage: 'كلمة المرور غير صحيحة',
              ),
              SizedBox(height: 8),
              PasswordField(
                onSaved: (value) {
                  newPassword = value!;
                },
                hintText: 'كلمة المرور الجديدة',
                validate: false,
              ),
              SizedBox(height: 16),
              PasswordField(
                errorMessage: 'كلمة المرور غير متطابقة',
                hintText: 'تأكيد كلمة المرور الجديدة',
                validate: false,
              ),
              SizedBox(height: 74),
              CustomButton(
                text: 'حفظ التغيرات',
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    widget.updateUserDataRepo.updatePassword(
                      oldPassword: currentPassword,
                      newPassword: newPassword,
                    );
                  } else {
                    {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
