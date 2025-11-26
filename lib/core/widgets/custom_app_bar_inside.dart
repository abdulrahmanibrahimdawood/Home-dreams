import 'package:flutter/material.dart';
import 'package:home_dreams/core/widgets/notification_widget.dart';

import '../utils/app_text_styles.dart';

AppBar buildAppBarInside(
  context, {
  required String title,
  bool showBackButton = true,
  bool showNotification = true,
}) {
  return AppBar(
    backgroundColor: Colors.white,
    actions: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Visibility(
          visible: showNotification,
          child: NotificationWidget(),
        ),
      ),
    ],
    leading: Visibility(
      visible: showBackButton,
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: const Icon(Icons.arrow_back_ios_new),
      ),
    ),
    centerTitle: true,
    title: Text(title, textAlign: TextAlign.center, style: TextStyles.bold19),
  );
}
 