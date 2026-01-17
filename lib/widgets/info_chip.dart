import 'package:dnd_helper/DS/pallete.dart';
import 'package:dnd_helper/widgets/liquid_container.dart';
import 'package:flutter/material.dart';

class InfoChip extends StatelessWidget {
  const InfoChip({
    super.key,
    required this.label,
    this.icon,
    this.selected = false,
    this.onTap,
    this.onSelected,
    this.selectedColor,
    this.unselectedColor,
    this.textColor,
    this.borderRadius = 8,
    this.padding = const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    this.minWidth,
  });

  final String label;
  final Widget? icon;
  final bool selected;
  final VoidCallback? onTap;
  final ValueChanged<bool>? onSelected;
  final Color? selectedColor;
  final Color? unselectedColor;
  final Color? textColor;
  final double borderRadius;
  final EdgeInsets padding;
  final double? minWidth;

  @override
  Widget build(BuildContext context) {
    final bgColor = selected
        ? (selectedColor ?? Pallete.primary)
        : (unselectedColor ?? Pallete.primaryAlpha100);

    final fgColor = textColor ??
        (bgColor.computeLuminance() > 0.5
            ? Pallete.primaryBlackText
            : Pallete.secondaryBG);

    final content = Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (icon != null) ...[
          IconTheme(
            data: IconThemeData(color: fgColor, size: 16),
            child: icon!,
          ),
          const SizedBox(width: 6),
        ],
        Text(
          label,
          style: TextStyle(
            color: fgColor,
            fontWeight: selected ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
      ],
    );

    final chip = LiquidContainer(
      radius: borderRadius,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        constraints: minWidth != null ? BoxConstraints(minWidth: minWidth!) : null,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color: bgColor,
        ),
        child: Padding(
          padding: padding,
          child: content,
        ),
      ),
    );

    if (onTap != null || onSelected != null) {
      return GestureDetector(
        onTap: () {
          onTap?.call();
          onSelected?.call(!selected);
        },
        child: chip,
      );
    }

    return chip;
  }
}
