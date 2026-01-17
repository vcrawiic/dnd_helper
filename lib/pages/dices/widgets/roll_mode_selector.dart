import 'package:dnd_helper/DS/pallete.dart';
import 'package:dnd_helper/pages/auth/widgets/custom_segmented_control.dart';
import 'package:dnd_helper/pages/dices/dice_cubit.dart';
import 'package:dnd_helper/pages/dices/dice_state.dart';
import 'package:dnd_helper/services/dices/models/dice_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RollModeSelector extends StatelessWidget {
  const RollModeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiceCubit, DiceState>(
      buildWhen: (prev, curr) => prev.mode != curr.mode,
      builder: (context, state) {
        final cubit = context.read<DiceCubit>();

        return CustomSegmentedControl<RollMode>(
          groupValue: state.mode,
          onValueChanged: cubit.setMode,
          selectedColor: Pallete.primaryAlpha100,
          unselectedColor: Pallete.primaryBGAlpha100,
          borderColor: Pallete.primary,
          children: const {
            RollMode.disadvantage: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Disadv.'),
              ],
            ),
            RollMode.normal: Text('Normal'),
            RollMode.advantage: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Adv.'),
              ],
            ),
          },
        );
      },
    );
  }
}
