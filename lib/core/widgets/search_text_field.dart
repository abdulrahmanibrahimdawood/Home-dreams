import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:home_dreams/core/utils/app_images.dart';
import 'package:home_dreams/core/utils/app_text_styles.dart';
import 'package:home_dreams/core/widgets/custom_text_form_field.dart';
import 'package:home_dreams/generated/l10n.dart';

class SearchTextField extends StatelessWidget {
  final VoidCallback? onTap;
  final void Function()? onTapIcon;
  final bool readOnly;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final TextEditingController? controller;
  const SearchTextField({
    this.onTap,
    super.key,
    required this.readOnly,
    this.onChanged,
    this.onSubmitted,
    this.controller,
    this.onTapIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Theme.of(
              context,
            ).colorScheme.onSurface.withValues(alpha: 0.06),
            blurRadius: 9,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        onSubmitted: onSubmitted,
        onChanged: onChanged,
        readOnly: readOnly,
        onTap: onTap,
        decoration: InputDecoration(
          suffixIcon: InkWell(
            onTap: onTapIcon,
            child: SizedBox(
              width: 20,
              child: Center(
                child: SvgPicture.asset(Assets.assetsImagesSearchFilter),
              ),
            ),
          ),
          prefixIcon: SizedBox(
            width: 20,
            child: Center(
              child: SvgPicture.asset(Assets.assetsImagesSearchIcon),
            ),
          ),
          hintStyle: TextStyles.regular13.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
          hintText: S.of(context).searchHint,
          filled: true,
          fillColor: Theme.of(context).colorScheme.surfaceContainerHighest,
          border: buildBorder(context),
          enabledBorder: buildBorder(context),
          focusedBorder: buildBorder(context),
        ),
      ),
    );
  }
}
