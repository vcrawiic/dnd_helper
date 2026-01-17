import 'package:dnd_helper/pages/dices/dice_cubit.dart';
import 'package:dnd_helper/pages/dices/dice_state.dart';
import 'package:dnd_helper/pages/dices/widgets/counter_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RollCountSelector extends StatelessWidget {
  const RollCountSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiceCubit, DiceState>(
      buildWhen: (prev, curr) => prev.rollCount != curr.rollCount,
      builder: (context, state) {
        final cubit = context.read<DiceCubit>();

        return CounterRow(
          label: '${state.rollCount}x',
          onDecrement: state.rollCount > 1 ? () => cubit.setRollCount(state.rollCount - 1) : null,
          onIncrement: state.rollCount < 10 ? () => cubit.setRollCount(state.rollCount + 1) : null,
        );
      },
    );
  }
}
