import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:home_dreams/core/utils/app_images.dart';
import 'package:home_dreams/core/utils/app_text_styles.dart';

class NoProductsWidget extends StatelessWidget {
  const NoProductsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 8),

            Text(
              'لاتوجد نتائج بحث',
              style: TextStyles.semiBold13.copyWith(
                color: const Color(0xFF949D9E),
              ),
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.08),
            SvgPicture.asset(Assets.assetsImagesNoporducts),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.05),
            Text(
              'عفوًا... هذه المعلومات غير متوفرة للحظة',
              style: TextStyles.semiBold13.copyWith(
                color: const Color(0xFF949D9E),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
