import 'package:flutter/material.dart';
import 'package:home_dreams/features/home/domain/entites/bottom_navigation_bar_entity.dart';
import 'package:home_dreams/features/home/presentation/views/widgets/active_item.dart';
import 'package:home_dreams/features/home/presentation/views/widgets/in_active_item.dart';
import 'package:home_dreams/generated/l10n.dart';

class NavigationBarItem extends StatelessWidget {
  const NavigationBarItem({
    super.key,
    required this.isSelected,
    required this.bottomNavigationBarEntity,
    required this.index,
  });
  final bool isSelected;
  final BottomNavigationBarEntity bottomNavigationBarEntity;
  final int index;
  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final labels = [s.navHome, s.navProducts, s.navCart, s.navAccount];
    return isSelected
        ? ActiveItem(
            image: bottomNavigationBarEntity.activeImage,
            text: labels[index],
          )
        : InActiveItem(image: bottomNavigationBarEntity.inActiveImage);
  }
}
