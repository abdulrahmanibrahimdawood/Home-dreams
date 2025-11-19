import 'package:flutter/material.dart';
import 'package:home_dreams/core/utils/app_colors.dart';
import 'package:home_dreams/core/utils/app_text_styles.dart';
import 'package:home_dreams/features/auth/presentation/views/widgets/custom_chech_box.dart';

class TermsAndCondations extends StatefulWidget {
  const TermsAndCondations({super.key, required this.onChanged});
  final ValueChanged<bool> onChanged;

  @override
  State<TermsAndCondations> createState() => _TermsAndCondationsState();
}

class _TermsAndCondationsState extends State<TermsAndCondations> {
  bool isTermedAccepts = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCheckBox(
          isChecked: isTermedAccepts,
          onChecked: (value) {
            isTermedAccepts = value;
            widget.onChanged(value);
            setState(() {});
          },
        ),
        SizedBox(width: 16),
        Expanded(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'من خلال إنشاء حساب ، فإنك توافق علي ',
                  style: TextStyles.semiBold13.copyWith(
                    color: Color(0xff949D9E),
                  ),
                ),
                TextSpan(
                  text: 'الشروط والأحكام الخاصة بنا',
                  style: TextStyles.semiBold13.copyWith(
                    color: AppColors.lightPrimaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
