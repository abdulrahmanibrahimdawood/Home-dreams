import 'package:flutter/material.dart';
import 'package:home_dreams/features/home/domain/entites/bottom_navigation_bar_entity.dart';
import 'package:home_dreams/features/home/presentation/views/widgets/navigation_bar_item.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final Function(int) onItemTapped;
  const CustomBottomNavigationBar({super.key, required this.onItemTapped});

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375,
      height: 70,
      decoration: ShapeDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        shadows: [
          BoxShadow(
            color: Theme.of(
              context,
            ).colorScheme.onSurface.withValues(alpha: 0.10),
            blurRadius: 25,
            offset: const Offset(0, -2),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        children: bottomNavigationBarItems.asMap().entries.map((e) {
          var index = e.key;
          var entity = e.value;
          return Expanded(
            flex: index == selectedIndex ? 3 : 2,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
                widget.onItemTapped(index);
              },
              child: NavigationBarItem(
                isSelected: index == selectedIndex,
                bottomNavigationBarEntity: entity,
                index: index,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
