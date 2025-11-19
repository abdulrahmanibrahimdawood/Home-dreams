import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:home_dreams/core/utils/app_images.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: ShapeDecoration(
        shape: OvalBorder(),
        color: Color.fromARGB(255, 230, 239, 245),
      ),
      child: SvgPicture.asset(Assets.assetsImagesNotification),
    );
  }
}
