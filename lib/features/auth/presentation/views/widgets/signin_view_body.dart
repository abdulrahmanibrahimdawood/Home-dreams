import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_dreams/constants.dart';
import 'package:home_dreams/core/utils/app_colors.dart';
import 'package:home_dreams/core/utils/app_images.dart';
import 'package:home_dreams/core/utils/app_text_styles.dart';
import 'package:home_dreams/core/widgets/custom_button.dart';
import 'package:home_dreams/core/widgets/custom_password_field.dart';
import 'package:home_dreams/core/widgets/custom_text_form_field.dart';
import 'package:home_dreams/features/auth/presentation/managers/signin_cubit/signin_cubit.dart';
import 'package:home_dreams/features/auth/presentation/views/forget_password_view.dart';
import 'package:home_dreams/features/auth/presentation/views/widgets/dont_have_an_account_widget.dart';
import 'package:home_dreams/features/auth/presentation/views/widgets/or_divider.dart';
import 'package:home_dreams/features/auth/presentation/views/widgets/social_login_button.dart';

class SigninViewBody extends StatefulWidget {
  const SigninViewBody({super.key});

  @override
  State<SigninViewBody> createState() => _SigninViewBodyState();
}

class _SigninViewBodyState extends State<SigninViewBody> {
  late String email, password;
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
              CustomTextFormField(
                errorMessage: 'يرجى كتابة البريد الإلكتروني',
                onSaved: (value) {
                  email = value!;
                },
                hintText: 'البريد الإلكتروني',
                textInputType: TextInputType.emailAddress,
              ),
              SizedBox(height: 16),
              PasswordField(
                onSaved: (value) {
                  password = value!;
                },
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        ForgetPasswordView.routeName,
                      );
                    },
                    child: Text(
                      " نسيت كلمة المرور؟",
                      style: TextStyles.bold13.copyWith(
                        color: AppColors.lightPrimaryColor,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 33),
              CustomButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    context.read<SigninCubit>().signin(email, password);
                  } else {
                    {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  }
                },
                text: 'تسجيل دخول',
              ),
              SizedBox(height: 33),
              DontHaveAnAccountWidget(),
              SizedBox(height: 33),
              OrDivider(),
              SizedBox(height: 33),
              SocialLoginButton(
                onPressed: () {
                  context.read<SigninCubit>().signinWithGoogle();
                },
                image: Assets.assetsImagesGoogleIcon,
                title: 'تسجيل بواسطة جوجل ',
              ),
              SizedBox(height: 16),
              Platform.isIOS
                  ? Column(
                      children: [
                        SocialLoginButton(
                          onPressed: () {
                            context.read<SigninCubit>().signInWithApple();
                          },
                          image: Assets.assetsImagesAppleIcon,
                          title: 'تسجيل بواسطة أبل ',
                        ),

                        SizedBox(height: 16),
                      ],
                    )
                  : SizedBox(),
              SocialLoginButton(
                onPressed: () {
                  context.read<SigninCubit>().signInWithFacebook();
                },
                image: Assets.assetsImagesFacebookIcon,
                title: 'تسجيل بواسطة فيسبوك ',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
