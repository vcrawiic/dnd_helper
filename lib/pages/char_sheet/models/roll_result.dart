import 'package:dnd_helper/services/dices/models/dice_model.dart';

/// Результат броска для показа карточкой в углу листа.
/// [kind] — вид («ПРОВЕРКА»/«СПАСБРОСОК»), [target] — цель («АТЛЕТИКИ»/«СИЛЫ»).
class RollResult {
  final String kind;
  final String target;
  final DiceRoll roll;

  const RollResult({
    required this.kind,
    required this.target,
    required this.roll,
  });
}
