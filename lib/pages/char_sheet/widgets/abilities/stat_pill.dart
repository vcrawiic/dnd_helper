import 'package:dnd_helper/DS/pallete.dart';
import 'package:dnd_helper/pages/char_sheet/models/skill_catalog.dart';
import 'package:dnd_helper/pages/char_sheet/widgets/abilities/prof_dot.dart';
import 'package:dnd_helper/pages/char_sheet/widgets/abilities/roll_button.dart';
import 'package:flutter/material.dart';

/// Пилюля «Проверка/Спасбросок»: подпись, точка владения (опц.) и модификатор
/// как кнопка броска (тап — 1d20+мод, long-press — преимущество/помеха).
class StatPill extends StatelessWidget {
  final String label;
  final String target;
  final int modifier;
  final bool proficient;
  final VoidCallback? onTapDot;

  const StatPill({
    super.key,
    required this.label,
    required this.target,
    required this.modifier,
    this.proficient = false,
    this.onTapDot,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Pallete.borderColor, width: 1.5),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Row(
        children: [
          if (onTapDot != null) ...[
            ProfDot(proficient: proficient, onTap: onTapDot),
            const SizedBox(width: 8),
          ],
          Expanded(
            child: Text(
              label,
              style: TextStyle(
                color: Pallete.primaryWhiteTextAlpha200,
                fontSize: 12,
              ),
            ),
          ),
          RollButton(
            kind: label.toUpperCase(),
            target: target.toUpperCase(),
            modifier: modifier,
            child: Text(
              fmtMod(modifier),
              style: const TextStyle(
                color: Pallete.secondaryWhiteText,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
