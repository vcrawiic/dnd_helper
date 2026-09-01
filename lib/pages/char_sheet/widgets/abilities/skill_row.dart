import 'package:dnd_helper/DS/pallete.dart';
import 'package:dnd_helper/pages/char_sheet/models/skill_catalog.dart';
import 'package:dnd_helper/pages/char_sheet/widgets/abilities/prof_dot.dart';
import 'package:dnd_helper/pages/char_sheet/widgets/abilities/roll_button.dart';
import 'package:flutter/material.dart';

/// Строка навыка: точка владения (тап циклит владение/компетентность), подпись
/// и модификатор как кнопка броска (тап — 1d20+мод, long-press — преим./помеха).
class SkillRow extends StatelessWidget {
  final String label;
  final int modifier;
  final bool proficient;
  final bool expertise;
  final VoidCallback onTap;

  const SkillRow({
    super.key,
    required this.label,
    required this.modifier,
    required this.proficient,
    required this.expertise,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        children: [
          ProfDot(proficient: proficient, expertise: expertise, onTap: onTap),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              label,
              style: const TextStyle(
                color: Pallete.primaryWhiteText,
                fontSize: 14,
              ),
            ),
          ),
          RollButton(
            kind: 'ПРОВЕРКА',
            target: label.toUpperCase(),
            modifier: modifier,
            child: Text(
              fmtMod(modifier),
              style: const TextStyle(
                color: Pallete.secondaryWhiteText,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
