import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_dreams/constants.dart';
import 'package:home_dreams/core/helper_funcations/get_user.dart';
import 'package:home_dreams/core/utils/app_images.dart';
import 'package:home_dreams/core/utils/app_text_styles.dart';
import 'package:home_dreams/core/widgets/custom_button.dart';
import 'package:home_dreams/core/widgets/custom_password_field.dart';
import 'package:home_dreams/core/widgets/custom_text_form_field.dart';
import 'package:home_dreams/features/auth/domain/entites/user_entity.dart';
import 'package:home_dreams/features/profile/presentation/manager/update_user_data_cubit/update_user_data_cubit.dart';

class EditProfileViewBody extends StatefulWidget {
  const EditProfileViewBody({super.key});

  @override
  State<EditProfileViewBody> createState() => _EditProfileViewBodyState();
}

class _EditProfileViewBodyState extends State<EditProfileViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late final TextEditingController nameController;
  late final TextEditingController emailController;
  late final TextEditingController oldPasswordController;
  late final TextEditingController newPasswordController;
  late final TextEditingController confirmPasswordController;

  bool? emailValidate,
      passwordValidate,
      newPasswordValidate,
      confirmPasswordValidate;

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  void initState() {
    super.initState();
    final user = getUser();

    nameController = TextEditingController(text: user.name);
    emailController = TextEditingController(text: user.email);
    oldPasswordController = TextEditingController();
    newPasswordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    oldPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final user = getUser();
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: Form(
          key: _formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              const SizedBox(height: 24),
              Align(
                alignment: Alignment.topRight,
                child: Text('المعلومات الشخصيه', style: TextStyles.semiBold13),
              ),
              const SizedBox(height: 8),
              CustomTextFormField(
                validate: false,
                hintText: 'الاسم الكامل',
                controller: nameController,
                textInputType: TextInputType.name,
                suffixIcon: Image.asset(Assets.assetsImagesEdit),
              ),
              const SizedBox(height: 8),
              CustomTextFormField(
                validate: emailValidate ?? false,
                hintText: 'البريد الإلكتروني',
                controller: emailController,
                textInputType: TextInputType.emailAddress,
                suffixIcon: Image.asset(Assets.assetsImagesEdit),
              ),
              const SizedBox(height: 16),
              Align(
                alignment: Alignment.topRight,
                child: Text('تغيير كلمة المرور', style: TextStyles.semiBold13),
              ),
              const SizedBox(height: 8),
              PasswordField(
                validate: passwordValidate ?? false,
                controller: oldPasswordController,
                hintText: 'كلمة المرور الحالية',
                errorMessage: 'كلمة المرور غير صحيحة',
              ),
              const SizedBox(height: 8),
              PasswordField(
                validate: newPasswordValidate ?? false,
                controller: newPasswordController,
                hintText: 'كلمة المرور الجديدة',
              ),
              const SizedBox(height: 16),
              PasswordField(
                validate: confirmPasswordValidate ?? false,
                controller: confirmPasswordController,
                hintText: 'تأكيد كلمة المرور الجديدة',
                errorMessage: 'كلمة المرور غير متطابقة',
              ),
              const SizedBox(height: 74),
              CustomButton(
                text: 'حفظ التغيرات',
                onPressed: () {
                  if (!_formKey.currentState!.validate()) {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                    return;
                  }

                  final name = nameController.text.trim();
                  final email = emailController.text.trim();
                  final oldPassword = oldPasswordController.text;
                  final newPassword = newPasswordController.text;
                  final confirmPassword = confirmPasswordController.text;

                  emailValidate = false;
                  passwordValidate = false;
                  newPasswordValidate = false;
                  confirmPasswordValidate = false;

                  validator(
                    email,
                    user,
                    oldPassword,
                    newPassword,
                    confirmPassword,
                  );

                  setState(() {});

                  triggerCubit(
                    email,
                    user,
                    oldPassword,
                    context,
                    name,
                    newPassword,
                    confirmPassword,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void triggerCubit(
    String email,
    UserEntity user,
    String oldPassword,
    BuildContext context,
    String name,
    String newPassword,
    String confirmPassword,
  ) {
    if (email.isNotEmpty && email != user.email && oldPassword.isNotEmpty) {
      context.read<UpdateUserDataCubit>().updateEmail(
        newEmail: email,
        password: oldPassword,
      );
    }

    if (name.isNotEmpty && name != user.name) {
      context.read<UpdateUserDataCubit>().updateUserName(name: name);
    }

    if (newPassword.isNotEmpty &&
        newPassword == confirmPassword &&
        oldPassword.isNotEmpty) {
      context.read<UpdateUserDataCubit>().updatePassword(
        oldPassword: oldPassword,
        newPassword: newPassword,
      );
    }
  }

  void validator(
    String email,
    UserEntity user,
    String oldPassword,
    String newPassword,
    String confirmPassword,
  ) {
    if (email.isNotEmpty && email != user.email && oldPassword.isEmpty) {
      passwordValidate = true;
    }

    if (oldPassword.isNotEmpty &&
        (newPassword.isEmpty || confirmPassword.isEmpty)) {
      newPasswordValidate = true;
      confirmPasswordValidate = true;
    }

    if (newPassword.isNotEmpty &&
        confirmPassword.isNotEmpty &&
        newPassword != confirmPassword) {
      confirmPasswordValidate = true;
    }
  }
}
