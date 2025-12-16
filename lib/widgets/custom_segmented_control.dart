import 'package:dnd_helper/DS/pallete.dart';
import 'package:flutter/material.dart';

class CustomSegmentedControl<T> extends StatelessWidget {
  final Map<T, Widget> children;
  final T groupValue;
  final ValueChanged<T> onValueChanged;
  final Color selectedColor;
  final Color unselectedColor;
  final Color borderColor;
  final double borderRadius;
  final double borderWidth;

  const CustomSegmentedControl({
    super.key,
    required this.children,
    required this.groupValue,
    required this.onValueChanged,
    this.selectedColor = Colors.blue,
    this.unselectedColor = Colors.white,
    this.borderColor = Colors.blue,
    this.borderRadius = 8.0,
    this.borderWidth = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor,
          width: borderWidth,
        ),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius - borderWidth),
        child: Row(
          children: children.entries.map((entry) {
            final isSelected = entry.key == groupValue;
            final isFirst = children.keys.first == entry.key;

            return Expanded(
              child: GestureDetector(
                onTap: () => onValueChanged(entry.key),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeInOut,
                  decoration: BoxDecoration(
                    color: isSelected ? selectedColor : unselectedColor,
                    border: Border(
                      left: !isFirst
                          ? BorderSide(
                              color: borderColor,
                              width: borderWidth,
                            )
                          : BorderSide.none,
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 12,
                  ),
                  child: DefaultTextStyle(
                    style: TextStyle(
                      color: isSelected
                          ? (selectedColor.computeLuminance() > 0.5
                              ? Pallete.primaryText
                              : Pallete.primaryBG)
                          : (unselectedColor.computeLuminance() > 0.5
                              ? Pallete.primaryText
                              : Pallete.primaryBG),
                      fontSize: 14,
                      fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                    ),
                    textAlign: TextAlign.center,
                    child: entry.value,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
