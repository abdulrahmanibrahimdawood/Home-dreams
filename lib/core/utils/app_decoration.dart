import 'package:flutter/material.dart';

abstract class AppDecoration {
  static ShapeDecoration greyBoxDecoration(BuildContext context) {
    return ShapeDecoration(
      color: Theme.of(context).colorScheme.surfaceContainer.withValues(alpha: 0.47),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(4),
      ),
    );
  }
}
