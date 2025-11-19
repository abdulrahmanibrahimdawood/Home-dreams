import 'package:flutter/material.dart';
import 'package:home_dreams/core/utils/app_text_styles.dart';
import 'package:home_dreams/core/widgets/notification_widget.dart';

AppBar buildAppBar(context) {
  return AppBar(
    actions: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: const NotificationWidget(),
      ),
    ],
    leading: GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: const Icon(Icons.arrow_back_ios_new),
    ),
    backgroundColor: Colors.transparent,
    elevation: 0,
    centerTitle: true,
    title: const Text('الأكثر مبيعًا', style: TextStyles.bold19),
  );
}
