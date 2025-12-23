import 'package:dnd_helper/widgets/liquid_container.dart';
import 'package:flutter/material.dart';

class CustomNavBarItem {
  final IconData icon;
  final String label;

  const CustomNavBarItem({
    required this.icon,
    required this.label,
  });
}

class CustomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  final List<CustomNavBarItem> items;
  final Color selectedColor;
  final Color unselectedColor;
  final Color backgroundColor;
  final Color selectedBackgroundColor;

  const CustomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.items,
    required this.selectedColor,
    required this.unselectedColor,
    required this.backgroundColor,
    required this.selectedBackgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(
          items.length,
          (index) => _NavBarItem(
            item: items[index],
            isSelected: index == currentIndex,
            onTap: () => onTap(index),
            selectedColor: selectedColor,
            unselectedColor: unselectedColor,
            selectedBackgroundColor: selectedBackgroundColor,
          ),
        ),
      ),
    );
  }
}

class _NavBarItem extends StatelessWidget {
  final CustomNavBarItem item;
  final bool isSelected;
  final VoidCallback onTap;
  final Color selectedColor;
  final Color unselectedColor;
  final Color selectedBackgroundColor;

  const _NavBarItem({
    required this.item,
    required this.isSelected,
    required this.onTap,
    required this.selectedColor,
    required this.unselectedColor,
    required this.selectedBackgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: LiquidContainer(
          radius: 16,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: isSelected ? selectedBackgroundColor : Colors.transparent,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: isSelected ? selectedColor : unselectedColor,
                  size: 24,
                ),
                const SizedBox(height: 4),
                Text(
                  item.label,
                  style: TextStyle(
                    color: isSelected ? selectedColor : unselectedColor,
                    fontSize: 12,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
