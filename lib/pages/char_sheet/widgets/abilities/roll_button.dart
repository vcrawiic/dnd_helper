import 'package:dnd_helper/DI/global_dependencies.dart';
import 'package:dnd_helper/DS/pallete.dart';
import 'package:dnd_helper/pages/char_sheet/models/roll_result.dart';
import 'package:dnd_helper/pages/char_sheet/providers/roll_result_provider.dart';
import 'package:dnd_helper/services/dices/models/dice_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Кнопка-модификатор: тап — бросок 1d20+мод, long-press — выбор
/// преимущество/помеха (два d20). Результат кладётся в [rollResultProvider]
/// и показывается карточкой в углу листа. Отправка в комнату — позже.
class RollButton extends ConsumerWidget {
  final String kind;
  final String target;
  final int modifier;
  final Widget child;

  const RollButton({
    super.key,
    required this.kind,
    required this.target,
    required this.modifier,
    required this.child,
  });

  void _roll(WidgetRef ref, RollMode mode) {
    final roll = GlobalDependencies.diceRollerService.rollDice(
      sides: 20,
      modifier: modifier,
      mode: mode,
    );
    ref
        .read(rollResultsProvider.notifier)
        .add(RollResult(kind: kind, target: target, roll: roll));
  }

  Future<void> _chooseMode(BuildContext context, WidgetRef ref) async {
    final box = context.findRenderObject() as RenderBox;
    final overlay = Overlay.of(context).context.findRenderObject() as RenderBox;
    final position = RelativeRect.fromRect(
      Rect.fromPoints(
        box.localToGlobal(Offset.zero, ancestor: overlay),
        box.localToGlobal(box.size.bottomRight(Offset.zero), ancestor: overlay),
      ),
      Offset.zero & overlay.size,
    );

    final mode = await showMenu<RollMode>(
      context: context,
      position: position,
      color: Pallete.greyDark.withValues(alpha: 0.98),
      items: const [
        PopupMenuItem(
          value: RollMode.advantage,
          child: Row(
            children: [
              Icon(Icons.keyboard_double_arrow_up, color: Pallete.hpHealthy),
              SizedBox(width: 8),
              Text('Преимущество'),
            ],
          ),
        ),
        PopupMenuItem(
          value: RollMode.disadvantage,
          child: Row(
            children: [
              Icon(Icons.keyboard_double_arrow_down, color: Pallete.primary),
              SizedBox(width: 8),
              Text('Помеха'),
            ],
          ),
        ),
      ],
    );
    if (mode != null) _roll(ref, mode);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => _roll(ref, RollMode.normal),
      onLongPress: () => _chooseMode(context, ref),
      behavior: HitTestBehavior.opaque,
      child: child,
    );
  }
}
