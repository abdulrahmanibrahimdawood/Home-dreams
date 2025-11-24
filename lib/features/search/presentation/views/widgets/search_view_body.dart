import 'package:flutter/material.dart';
import 'package:home_dreams/constants.dart';
import 'package:home_dreams/core/utils/app_text_styles.dart';
import 'package:home_dreams/core/widgets/search_text_field.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: Column(
          children: [
            SizedBox(height: 12),
            SearchTextField(readOnly: false),
            SizedBox(height: 16),
            Row(
              children: [
                Text(
                  'نتائج البحث ',
                  textAlign: TextAlign.center,
                  style: TextStyles.regular13.copyWith(
                    color: Color(0xFF949D9E),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
