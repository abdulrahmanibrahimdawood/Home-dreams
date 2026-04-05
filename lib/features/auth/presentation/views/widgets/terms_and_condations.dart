import 'package:flutter/material.dart';
import 'package:home_dreams/core/utils/app_text_styles.dart';
import 'package:home_dreams/features/auth/presentation/views/widgets/custom_chech_box.dart';
import 'package:home_dreams/generated/l10n.dart';

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
    final s = S.of(context);
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
                  text: s.termsAgreementPrefix,
                  style: TextStyles.semiBold13.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
                TextSpan(
                  text: s.termsAndConditions,
                  style: TextStyles.semiBold13.copyWith(
                    color: Theme.of(context).colorScheme.primaryContainer,
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
