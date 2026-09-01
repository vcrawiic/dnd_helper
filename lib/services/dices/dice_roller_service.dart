import 'dart:math';

import 'package:dnd_helper/services/dices/models/dice_model.dart';

class DiceRollerService {
  // Один общий генератор: пересев на каждый бросок мог давать одинаковые кубы
  // в серии (напр. два d20 преимущества в одну микросекунду).
  final Random _random = Random();

  DiceRoll rollDice({
    required int sides,
    int count = 1,
    int modifier = 0,
    RollMode mode = RollMode.normal,
    bool dropLowest = false,
  }) {
    return DiceRoll(
      sides: sides,
      count: count,
      rolls: _rollMultiple(sides, mode == RollMode.normal ? count : 2),
      modifier: modifier,
      mode: mode,
      dropLowest: dropLowest,
    );
  }

  List<DiceRoll> rollDiceMultiple({
    required int sides,
    int count = 1,
    int modifier = 0,
    RollMode mode = RollMode.normal,
    int rollCount = 1,
    bool dropLowest = false,
  }) {
    return List.generate(
      rollCount,
      (_) => rollDice(
        sides: sides,
        count: count,
        modifier: modifier,
        mode: mode,
        dropLowest: dropLowest,
      ),
    );
  }

  int _roll(int sides) => _random.nextInt(sides) + 1;

  List<int> _rollMultiple(int sides, int count) {
    return List.generate(count, (_) => _roll(sides));
  }
}
