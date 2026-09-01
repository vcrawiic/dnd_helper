import 'package:dnd_helper/DS/pallete.dart';
import 'package:dnd_helper/pages/char_sheet/models/char_stats_model.dart';
import 'package:flutter/material.dart';

/// Плитка здоровья в шапке: текущее/макс, цвет рамки по состоянию, тап → HP-калькулятор.
class HpTile extends StatelessWidget {
  final CharStats stats;
  final VoidCallback onTap;

  const HpTile({super.key, required this.stats, required this.onTap});

  Color get _border {
    if (stats.currentHp <= 0) return Pallete.primary;
    if (stats.currentHp <= stats.maxHp ~/ 2) return Pallete.hpBloodied;
    return Pallete.hpHealthy;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: 110,
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          border: Border.all(color: _border, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Text(
              '${stats.currentHp}/${stats.maxHp}',
              style: const TextStyle(
                color: Pallete.secondaryWhiteText,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              'ЗДОРОВЬЕ',
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
