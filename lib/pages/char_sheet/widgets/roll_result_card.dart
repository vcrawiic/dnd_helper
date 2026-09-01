import 'package:dnd_helper/DS/pallete.dart';
import 'package:dnd_helper/pages/char_sheet/models/roll_result.dart';
import 'package:dnd_helper/services/dices/models/dice_model.dart';
import 'package:flutter/material.dart';

/// Одна карточка броска: вид/цель, разбивка «(куб) ± мод», нотация и крупный
/// итог. Крестик вызывает [onClose] (чистит весь стек карточек).
class RollResultCard extends StatelessWidget {
  final RollResult result;
  final VoidCallback onClose;

  const RollResultCard({
    super.key,
    required this.result,
    required this.onClose,
  });

  String _mod(int m) => m == 0 ? '' : (m > 0 ? ' + $m' : ' − ${-m}');

  String _modeMark(RollMode mode) => switch (mode) {
    RollMode.advantage => ' ⬆',
    RollMode.disadvantage => ' ⬇',
    RollMode.normal => '',
  };

  @override
  Widget build(BuildContext context) {
    final roll = result.roll;
    final mod = _mod(roll.modifier);
    final dice = '(${roll.rolls.join(', ')})';
    final notation = '(${roll.rolls.length}к20${_modeMark(roll.mode)})';

    return Container(
      constraints: const BoxConstraints(minWidth: 220),
      decoration: BoxDecoration(
        color: const Color(0xFF1B1B24).withValues(alpha: 0.96),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Pallete.borderColor, width: 1.5),
      ),
      padding: const EdgeInsets.fromLTRB(16, 12, 8, 12),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              _title(),
              const SizedBox(height: 6),
              Text(
                '$dice$mod',
                style: const TextStyle(
                  color: Pallete.secondaryWhiteText,
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                '$notation$mod',
                style: TextStyle(
                  color: Pallete.primaryWhiteTextAlpha200,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          const SizedBox(width: 20),
          Text(
            '${roll.total}',
            style: TextStyle(
              color: roll.isNat20
                  ? Pallete.hpHealthy
                  : (roll.isNat1
                        ? Pallete.primary
                        : Pallete.secondaryWhiteText),
              fontSize: 44,
              fontWeight: FontWeight.bold,
              height: 1,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.close, size: 18),
            color: Pallete.primaryWhiteTextAlpha200,
            onPressed: onClose,
          ),
        ],
      ),
    );
  }

  Widget _title() {
    return RichText(
      text: TextSpan(
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.5,
        ),
        children: [
          TextSpan(
            text: '${result.kind} ',
            style: TextStyle(color: Pallete.borderColor),
          ),
          TextSpan(
            text: result.target,
            style: const TextStyle(color: Pallete.primaryWhiteText),
          ),
        ],
      ),
    );
  }
}
