import 'package:flutter/material.dart';
import 'package:home_dreams/core/utils/app_text_styles.dart';

class InActiveStepItem extends StatelessWidget {
  const InActiveStepItem({super.key, required this.text, required this.index});
  final String text;
  final String index;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 10,
          backgroundColor: Color(0xffF2F3F3),
          child: Text(
            index,
            style: TextStyles.semiBold13.copyWith(color: Colors.black),
          ),
        ),
        SizedBox(width: 4),
        Text(
          text,
          style: TextStyles.semiBold13.copyWith(color: Color(0xffAAAAAA)),
        ),
      ],
    );
  }
}
