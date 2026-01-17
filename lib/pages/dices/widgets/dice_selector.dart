import 'package:dnd_helper/pages/dices/dice_cubit.dart';
import 'package:dnd_helper/pages/dices/dice_state.dart';
import 'package:dnd_helper/pages/dices/widgets/custom_dice_dialog.dart';
import 'package:dnd_helper/widgets/info_chip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DiceSelector extends StatelessWidget {
  const DiceSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiceCubit, DiceState>(
      buildWhen: (prev, curr) =>
          prev.sides != curr.sides || prev.isCustomDice != curr.isCustomDice,
      builder: (context, state) {
        final cubit = context.read<DiceCubit>();

        const chipPadding = EdgeInsets.symmetric(horizontal: 12, vertical: 8);
        const chipMinWidth = 64.0;

        return Wrap(
          spacing: 8,
          runSpacing: 8,
          alignment: WrapAlignment.center,
          children: [
            ...DiceState.standardDice.map((sides) {
              final isSelected = state.sides == sides && !state.isCustomDice;
              return InfoChip(
                label: 'd$sides',
                selected: isSelected,
                onSelected: (_) => cubit.selectStandardDice(sides),
                padding: chipPadding,
                minWidth: chipMinWidth,
              );
            }),
            InfoChip(
              label: state.isCustomDice ? 'd${state.sides}' : 'Custom',
              icon: const Icon(Icons.edit),
              selected: state.isCustomDice,
              onTap: () => _showCustomDiceDialog(context),
              padding: chipPadding,
              minWidth: chipMinWidth,
            ),
          ],
        );
      },
    );
  }

  void _showCustomDiceDialog(BuildContext context) {
    final cubit = context.read<DiceCubit>();
    showDialog(
      context: context,
      builder: (_) => BlocProvider.value(
        value: cubit,
        child: const CustomDiceDialog(),
      ),
    );
  }
}
