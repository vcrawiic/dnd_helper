import 'package:dnd_helper/DS/pallete.dart';
import 'package:dnd_helper/pages/dices/dice_cubit.dart';
import 'package:dnd_helper/pages/dices/dice_state.dart';
import 'package:dnd_helper/pages/dices/widgets/dice_count_selector.dart';
import 'package:dnd_helper/pages/dices/widgets/dice_result.dart';
import 'package:dnd_helper/pages/dices/widgets/dice_selector.dart';
import 'package:dnd_helper/pages/dices/widgets/modifier_input.dart';
import 'package:dnd_helper/pages/dices/widgets/roll_count_selector.dart';
import 'package:dnd_helper/pages/dices/widgets/roll_history.dart';
import 'package:dnd_helper/pages/dices/widgets/roll_mode_selector.dart';
import 'package:dnd_helper/widgets/info_chip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DicePage extends StatelessWidget {
  const DicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/dung.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Pallete.transparent,
        appBar: AppBar(
          title: const Text(
            'Dices',
            style: TextStyle(color: Pallete.primaryWhiteText),
          ),
          backgroundColor: Pallete.transparent,
          actions: [
            IconButton(
              icon: const Icon(Icons.refresh),
              tooltip: 'Сбросить настройки',
              onPressed: () => context.read<DiceCubit>().resetSettings(),
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 120),
          child: Column(
            children: [
              const DiceSelector(),
              const SizedBox(height: 16),

              const DiceCountSelector(),
              const SizedBox(height: 8),

              const RollCountSelector(),
              const SizedBox(height: 8),

              const ModifierInput(),
              const SizedBox(height: 16),

              BlocBuilder<DiceCubit, DiceState>(
                buildWhen: (prev, curr) =>
                    prev.count != curr.count || prev.dropLowest != curr.dropLowest,
                builder: (context, state) {
                  if (state.count > 1) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: InfoChip(
                        label: 'Drop lowest',
                        icon: const Icon(Icons.arrow_downward),
                        selected: state.dropLowest,
                        onSelected: (selected) =>
                            context.read<DiceCubit>().setDropLowest(selected),
                      ),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),

              BlocBuilder<DiceCubit, DiceState>(
                buildWhen: (prev, curr) =>
                    prev.sides != curr.sides || prev.count != curr.count,
                builder: (context, state) {
                  if (state.sides == 20 && state.count == 1) {
                    return const Padding(
                      padding: EdgeInsets.only(bottom: 16),
                      child: RollModeSelector(),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),

              const SizedBox(height: 32),
              const DiceResult(),
              const SizedBox(height: 32),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => context.read<DiceCubit>().roll(),
                  child: const Text('Roll'),
                ),
              ),
              const SizedBox(height: 16),
              const RollHistory(),
            ],
          ),
        ),
      ),
    );
  }
}
