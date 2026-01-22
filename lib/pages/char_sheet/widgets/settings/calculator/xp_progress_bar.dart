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
    return Row(
      children: [
        Text(
          '$currentLevel',
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.purple,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: LayoutBuilder(
            builder: (context, constraints) {
              final xpPosition = _progress * constraints.maxWidth;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 24,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Positioned(
                          left: 0,
                          right: 0,
                          bottom: 0,
                          child: LinearProgressIndicator(
                            value: _progress,
                            backgroundColor: Colors.grey.shade800,
                            valueColor: const AlwaysStoppedAnimation(
                              Colors.purple,
                            ),
                            minHeight: 4,
                          ),
                        ),
                        Positioned(
                          left: (xpPosition - 20).clamp(
                            0,
                            constraints.maxWidth - 40,
                          ),
                          top: 0,
                          child: Text(
                            '$currentXp',
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.purple,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '$xpForCurrentLevel',
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.grey.shade500,
                        ),
                      ),
                      Text(
                        '$xpForNextLevel',
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
        const SizedBox(width: 12),
        Text(
          '${currentLevel + 1}',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.grey.shade600,
          ),
        ),
      ],
    );
  }
}
