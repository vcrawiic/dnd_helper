import 'package:dnd_helper/pages/dices/dice_cubit.dart';
import 'package:dnd_helper/pages/dices/dice_state.dart';
import 'package:dnd_helper/pages/dices/widgets/counter_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DiceCountSelector extends StatelessWidget {
  const DiceCountSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiceCubit, DiceState>(
      buildWhen: (prev, curr) =>
          prev.count != curr.count || prev.sides != curr.sides,
      builder: (context, state) {
        final cubit = context.read<DiceCubit>();

        return CounterRow(
          label: '${state.count}d${state.sides}',
          onIncrement: state.count < 10 ? () => cubit.setCount(state.count + 1) : null,
          onDecrement: state.count > 1 ? () => cubit.setCount(state.count - 1) : null,
          fontSize: 24,
        );
      },
    );
  }
}
