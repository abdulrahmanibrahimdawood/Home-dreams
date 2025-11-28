import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:home_dreams/core/utils/app_images.dart';
import 'package:home_dreams/core/utils/app_text_styles.dart';
import 'package:home_dreams/core/widgets/custom_text_form_field.dart';

class SearchTextField extends StatelessWidget {
  final VoidCallback? onTap;
  final bool readOnly;
  final void Function(String)? onSubmitted;
  const SearchTextField({
    this.onTap,
    super.key,
    required this.readOnly,
    this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0x0A000000),
            blurRadius: 9,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        onSubmitted: onSubmitted,
        readOnly: readOnly,
        onTap: onTap,
        decoration: InputDecoration(
          suffixIcon: SizedBox(
            width: 20,
            child: Center(
              child: SvgPicture.asset(Assets.assetsImagesSearchFilter),
            ),
          ),
          prefixIcon: SizedBox(
            width: 20,
            child: Center(
              child: SvgPicture.asset(Assets.assetsImagesSearchIcon),
            ),
          ),
          hintStyle: TextStyles.regular13.copyWith(color: Color(0xff949D9E)),
          hintText: 'ابحث عن.......',
          filled: true,
          fillColor: Colors.white,
          border: buildBorder(),
          enabledBorder: buildBorder(),
          focusedBorder: buildBorder(),
        ),
      ),
    );
  }
}
