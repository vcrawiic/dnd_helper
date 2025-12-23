import 'package:dnd_helper/DS/pallete.dart';
import 'package:dnd_helper/widgets/liquid_container.dart';
import 'package:flutter/material.dart';

class InfoChip extends StatelessWidget {
  const InfoChip({
    super.key,
    required this.label,
    this.onTap,
  });

  final String label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final chip = LiquidContainer(
      radius: 8,
      child: Chip(
        label: Text(
          label,
          style: TextStyle(color: Pallete.secondaryBG),
        ),
        backgroundColor: Pallete.primaryAlpha200,
      ),
    );

    if (onTap != null) {
      return GestureDetector(
        onTap: onTap,
        child: chip,
      );
    }

    return chip;
  }
}
