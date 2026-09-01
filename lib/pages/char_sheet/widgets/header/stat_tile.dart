import 'package:dnd_helper/DS/pallete.dart';
import 'package:flutter/material.dart';

/// Плитка сводной характеристики в шапке (AC, скорость, мастерство и т.п.).
class StatTile extends StatelessWidget {
  final String label;
  final String value;
  final VoidCallback? onTap;
  final bool highlighted;

  const StatTile({
    super.key,
    required this.label,
    required this.value,
    this.onTap,
    this.highlighted = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: 96,
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: highlighted ? Pallete.primaryAlpha100 : Colors.transparent,
          border: Border.all(
            color: highlighted ? Pallete.primary : Pallete.borderColor,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Text(
              value,
              style: const TextStyle(
                color: Pallete.secondaryWhiteText,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              label,
              style: TextStyle(
                color: Pallete.primaryWhiteTextAlpha200,
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
