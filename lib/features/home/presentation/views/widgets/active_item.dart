import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:home_dreams/core/utils/app_text_styles.dart';

class ActiveItem extends StatelessWidget {
  const ActiveItem({super.key, required this.image, required this.text});
  final String image;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.only(left: 16),
        decoration: ShapeDecoration(
          color: Theme.of(context).colorScheme.outlineVariant,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 30,
              height: 30,
              decoration: ShapeDecoration(
                color: Theme.of(context).colorScheme.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Center(child: SvgPicture.asset(image)),
            ),
            SizedBox(width: 4),
            Text(
              text,
              style: TextStyles.semiBold11.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
