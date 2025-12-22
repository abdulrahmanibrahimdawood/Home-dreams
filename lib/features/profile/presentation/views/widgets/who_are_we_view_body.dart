import 'package:flutter/material.dart';
import 'package:home_dreams/constants.dart';
import 'package:home_dreams/core/utils/app_colors.dart';
import 'package:home_dreams/core/utils/app_text_styles.dart';

class WhoAreWeViewBody extends StatelessWidget {
  const WhoAreWeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 24),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(text: 'حول ', style: TextStyles.bold16),
                TextSpan(
                  text: 'أحلام المنزل \n',
                  style: TextStyles.bold16.copyWith(
                    color: AppColors.scoundaryColor,
                  ),
                ),
              ],
            ),
          ),

          Text(
            'نحن شركة احلام المنزل لتجارة وبيع أثاث المنزل، شركة سعودية مقرها الرئيسي مدينة جدة – المملكة العربية السعودية. '
            'تأسست الشركة عام 2022 بهدف تقديم حلول متكاملة في مجال الأثاث المنزلي العصري والكلاسيكي، بما يلبي احتياجات مختلف الأذواق والمساحات.',
            style: TextStyles.regular13,
          ),
          SizedBox(height: 12),

          Text(
            'منذ تأسيسنا، نحرص على توفير منتجات تجمع بين الجودة العالية، التصميم الأنيق، والأسعار التنافسية، '
            'مع الالتزام بأعلى معايير الخدمة ورضا العملاء.',
            style: TextStyles.regular13,
          ),
          SizedBox(height: 16),

          Text(
            'خدماتنا',
            style: TextStyles.bold13.copyWith(color: AppColors.scoundaryColor),
          ),
          SizedBox(height: 8),

          Text(
            '• بيع أثاث المنزل بمختلف أنواعه (غرف نوم، غرف معيشة، غرف طعام).\n'
            '• توفير أثاث مكتبي وقطع ديكور منزلية مميزة.\n'
            '• تصميمات متنوعة تناسب المساحات الحديثة والكلاسيكية.\n'
            '• خدمة توصيل سريعة وآمنة إلى جميع مناطق المملكة.\n'
            '• دعم فني وخدمة عملاء لمتابعة الطلبات والإجابة على استفسارات العملاء.',
            style: TextStyles.regular13,
          ),
        ],
      ),
    );
  }
}
