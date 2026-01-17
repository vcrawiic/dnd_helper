import 'package:dnd_helper/services/dices/models/dice_model.dart';

class DiceState {
  static const List<int> standardDice = [4, 6, 8, 10, 12, 20, 100];

  final int sides;
  final int count;
  final int rollCount;
  final int modifier;
  final RollMode mode;
  final bool dropLowest;
  final bool isCustomDice;
  final DiceRollGroup? lastRollGroup;
  final List<DiceRollGroup> history;

  DiceState({
    this.sides = 20,
    this.count = 1,
    this.rollCount = 1,
    this.modifier = 0,
    this.mode = RollMode.normal,
    this.dropLowest = false,
    this.isCustomDice = false,
    this.lastRollGroup,
    this.history = const [],
  });

  DiceState copyWith({
    int? sides,
    int? count,
    int? rollCount,
    int? modifier,
    RollMode? mode,
    bool? dropLowest,
    bool? isCustomDice,
    DiceRollGroup? lastRollGroup,
    List<DiceRollGroup>? history,
  }) {
    return DiceState(
      sides: sides ?? this.sides,
      count: count ?? this.count,
      rollCount: rollCount ?? this.rollCount,
      modifier: modifier ?? this.modifier,
      mode: mode ?? this.mode,
      dropLowest: dropLowest ?? this.dropLowest,
      isCustomDice: isCustomDice ?? this.isCustomDice,
      lastRollGroup: lastRollGroup ?? this.lastRollGroup,
      history: history ?? this.history,
    );
  }
}
