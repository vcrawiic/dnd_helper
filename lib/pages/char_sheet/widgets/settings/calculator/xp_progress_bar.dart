import 'package:dnd_helper/DS/pallete.dart';
import 'package:flutter/material.dart';

class XpProgressBar extends StatelessWidget {
  final int currentLevel;
  final int currentXp;
  final int xpForCurrentLevel;
  final int xpForNextLevel;

  const XpProgressBar({
    super.key,
    required this.currentLevel,
    required this.currentXp,
    required this.xpForCurrentLevel,
    required this.xpForNextLevel,
  });

  double get _progress {
    final range = xpForNextLevel - xpForCurrentLevel;
    if (range <= 0) return 1.0;
    final current = currentXp - xpForCurrentLevel;
    return (current / range).clamp(0.0, 1.0);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 26,
      decoration: BoxDecoration(
        border: Border.all(color: Pallete.borderColor, width: 2),
        borderRadius: BorderRadius.circular(12),
        color: Pallete.transparent,
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: Pallete.borderColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(4),
                bottomLeft: Radius.circular(4),
              ),
            ),
            alignment: Alignment.center,
            child: Text(
              '$currentLevel level',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Pallete.secondaryWhiteText,
              ),
            ),
          ),
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Stack(
                  children: [
                    Container(
                      width: constraints.maxWidth * _progress,
                      decoration: BoxDecoration(color: Pallete.progressColor),
                    ),
                    Center(
                      child: Text(
                        '$currentXp/$xpForNextLevel',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Pallete.primaryBlackText,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            alignment: Alignment.center,
            child: Text(
              '${currentLevel + 1}',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Pallete.primaryBlackText,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
