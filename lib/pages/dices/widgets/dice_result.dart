import 'package:dnd_helper/DS/pallete.dart';
import 'package:dnd_helper/pages/dices/dice_cubit.dart';
import 'package:dnd_helper/pages/dices/dice_state.dart';
import 'package:dnd_helper/services/dices/models/dice_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DiceResult extends StatelessWidget {
  const DiceResult({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiceCubit, DiceState>(
      buildWhen: (prev, curr) => prev.lastRollGroup != curr.lastRollGroup,
      builder: (context, state) {
        final group = state.lastRollGroup;

        if (group == null) {
          return Text(
            '?',
            style: TextStyle(
              fontSize: 72,
              fontWeight: FontWeight.bold,
              color: Pallete.primaryWhiteText,
            ),
          );
        }

        if (group.isSingleRoll) {
          return _buildSingleRollResult(group.firstRoll);
        }

        return _buildMultipleRollsResult(group);
      },
    );
  }

  Widget _buildSingleRollResult(DiceRoll roll) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '${roll.total}',
          style: TextStyle(
            fontSize: 96,
            fontWeight: FontWeight.bold,
            color: _getResultColor(roll),
          ),
        ),
        Text(
          roll.diceNotation,
          style: TextStyle(
            fontSize: 24,
            color: Pallete.primaryWhiteTextAlpha200,
          ),
        ),
        if (roll.rolls.length > 1 || roll.modifier != 0)
          _buildSingleRollDetails(roll),
        if (roll.mode != RollMode.normal && roll.advantageRoll != null)
          Text(
            'Thrown: ${roll.advantageRoll}',
            style: TextStyle(
              fontSize: 14,
              decoration: TextDecoration.lineThrough,
              color: Pallete.primaryWhiteTextAlpha200,
            ),
          ),
      ],
    );
  }

  Widget _buildSingleRollDetails(DiceRoll roll) {
    if (!roll.dropLowest || roll.rolls.length < 2) {
      return Text(
        _buildDetailsString(roll),
        style: TextStyle(
          fontSize: 16,
          color: Pallete.primaryWhiteTextAlpha200,
        ),
      );
    }

    final dropped = roll.droppedValue;
    bool droppedUsed = false;
    final modStr = roll.modifier != 0
        ? (roll.modifier > 0 ? ' + ${roll.modifier}' : ' - ${roll.modifier.abs()}')
        : '';

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('(', style: TextStyle(fontSize: 16, color: Pallete.primaryWhiteText)),
        ...roll.rolls.asMap().entries.map((entry) {
          final index = entry.key;
          final value = entry.value;
          final isDropped = !droppedUsed && value == dropped;
          if (isDropped) droppedUsed = true;

          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (index > 0)
                Text(' + ', style: TextStyle(fontSize: 16, color: Pallete.primaryWhiteTextAlpha200)),
              Text(
                '$value',
                style: TextStyle(
                  fontSize: 16,
                  color: isDropped ? Pallete.primary : Pallete.primaryWhiteTextAlpha200,
                  decoration: isDropped ? TextDecoration.lineThrough : null,
                ),
              ),
            ],
          );
        }),
        Text(')$modStr', style: TextStyle(fontSize: 16, color: Pallete.primaryWhiteTextAlpha200)),
      ],
    );
  }

  Widget _buildMultipleRollsResult(DiceRollGroup group) {
    final modifier = group.firstRoll.modifier;
    final totalWithMod = group.totalSum;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Wrap(
          spacing: 12,
          runSpacing: 8,
          alignment: WrapAlignment.center,
          children: group.rolls.map((roll) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: Pallete.primaryAlpha100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '${roll.total}',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: _getResultColor(roll),
                    ),
                  ),
                  if (roll.rolls.length > 1)
                    _buildRollDetails(roll),
                ],
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 16),
        Text(
          'Total: $totalWithMod',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Pallete.primaryWhiteText,
          ),
        ),
        if (modifier != 0)
          Text(
            '(${group.rolls.length} rolls ${modifier > 0 ? '+' : ''}$modifier each)',
            style: TextStyle(
              fontSize: 14,
              color: Pallete.primaryWhiteTextAlpha200,
            ),
          ),
        const SizedBox(height: 8),
        Text(
          group.notation,
          style: TextStyle(
            fontSize: 18,
            color: Pallete.primaryWhiteTextAlpha200,
          ),
        ),
      ],
    );
  }

  Widget _buildRollDetails(DiceRoll roll) {
    if (!roll.dropLowest) {
      return Text(
        '(${roll.rolls.join('+')})',
        style: TextStyle(
          fontSize: 12,
          color: Pallete.primaryWhiteTextAlpha200,
        ),
      );
    }

    final dropped = roll.droppedValue;
    bool droppedUsed = false;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('(', style: TextStyle(fontSize: 12, color: Pallete.primaryWhiteText)),
        ...roll.rolls.asMap().entries.map((entry) {
          final index = entry.key;
          final value = entry.value;
          final isDropped = !droppedUsed && value == dropped;
          if (isDropped) droppedUsed = true;

          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (index > 0)
                Text('+', style: TextStyle(fontSize: 12, color: Pallete.primaryWhiteTextAlpha200)),
              Text(
                '$value',
                style: TextStyle(
                  fontSize: 12,
                  color: isDropped ? Pallete.primary : Pallete.primaryWhiteTextAlpha200,
                  decoration: isDropped ? TextDecoration.lineThrough : null,
                ),
              ),
            ],
          );
        }),
        const Text(')', style: TextStyle(fontSize: 12, color: Pallete.primaryWhiteText)),
      ],
    );
  }

  Color _getResultColor(DiceRoll roll) {
    if (roll.isNat20) return Colors.green;
    if (roll.isNat1) return Colors.red;
    return Pallete.primaryWhiteText;
  }

  String _buildDetailsString(DiceRoll roll) {
    final rollsStr = roll.rolls.join(' + ');
    if (roll.modifier == 0) return '($rollsStr)';
    final modStr = roll.modifier > 0
        ? '+ ${roll.modifier}'
        : '- ${roll.modifier.abs()}';
    return '($rollsStr) $modStr';
  }
}
