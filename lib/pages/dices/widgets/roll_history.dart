import 'package:dnd_helper/DS/pallete.dart';
import 'package:dnd_helper/pages/dices/dice_cubit.dart';
import 'package:dnd_helper/pages/dices/dice_state.dart';
import 'package:dnd_helper/services/dices/models/dice_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RollHistory extends StatelessWidget {
  const RollHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiceCubit, DiceState>(
      buildWhen: (prev, curr) => prev.history != curr.history,
      builder: (context, state) {
        if (state.history.isEmpty) {
          return const SizedBox.shrink();
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'History',
                  style: TextStyle(
                    fontSize: 18,
                    color: Pallete.primaryWhiteText,
                  ),
                ),
                TextButton(
                  onPressed: () => context.read<DiceCubit>().clearHistory(),
                  child: Text('Clear'),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: state.history.take(20).map((group) {
                return _buildHistoryChip(group);
              }).toList(),
            ),
          ],
        );
      },
    );
  }

  Widget _buildHistoryChip(DiceRollGroup group) {
    if (group.isSingleRoll) {
      final roll = group.firstRoll;
      return Chip(
        avatar: _getModeIcon(roll.mode),
        label: Text('${roll.diceNotation} = ${roll.total}'),
        backgroundColor: _getChipColor(group),
      );
    }

    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: _getChipColor(group) ?? Pallete.greyDarkAlpha100,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            group.notation,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 4),
          ...group.rolls.asMap().entries.map((entry) {
            final index = entry.key;
            final roll = entry.value;
            return Text(
              '${index + 1}. ${roll.keptRolls.join('+')}${roll.modifier != 0 ? (roll.modifier > 0 ? '+${roll.modifier}' : '${roll.modifier}') : ''} = ${roll.total}',
              style: const TextStyle(fontSize: 11),
            );
          }),
          const Divider(height: 8),
          Text(
            'Total: ${group.totalSum}',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget? _getModeIcon(RollMode mode) {
    return switch (mode) {
      RollMode.advantage => const Icon(Icons.trending_up, size: 16, color: Colors.green),
      RollMode.disadvantage => const Icon(Icons.trending_down, size: 16, color: Colors.red),
      RollMode.normal => null,
    };
  }

  Color? _getChipColor(DiceRollGroup group) {
    if (group.hasNat20) return Colors.green.withOpacity(0.3);
    if (group.hasNat1) return Colors.red.withOpacity(0.3);
    return null;
  }
}
