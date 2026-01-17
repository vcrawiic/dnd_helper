import 'dart:math';

enum RollMode { normal, advantage, disadvantage }

class DiceRoll {
  final int sides;
  final int count;
  final List<int> rolls;
  final int modifier;
  final RollMode mode;
  final bool dropLowest;
  final DateTime timestamp;

  DiceRoll({
    required this.sides,
    required this.count,
    required this.rolls,
    required this.modifier,
    required this.mode,
    this.dropLowest = false,
    DateTime? timestamp,
  }) : timestamp = timestamp ?? DateTime.now();

  int? get droppedValue {
    if (!dropLowest || rolls.length < 2) return null;
    return rolls.reduce(min);
  }

  List<int> get keptRolls {
    if (!dropLowest || rolls.length < 2) return rolls;
    final sorted = List<int>.from(rolls)..sort();
    return sorted.sublist(1);
  }

  int get total {
    int base = switch (mode) {
      RollMode.advantage => rolls.reduce(max),
      RollMode.disadvantage => rolls.reduce(min),
      RollMode.normal => keptRolls.reduce((a, b) => a + b),
    };
    return base + modifier;
  }

  String get diceNotation {
    final countStr = count > 1 ? '$count' : '';
    final modStr = modifier > 0
        ? '+$modifier'
        : (modifier < 0 ? '$modifier' : '');
    final dropStr = dropLowest ? ' drop low' : '';
    return '${countStr}d$sides$modStr$dropStr';
  }

  int get _selectedRoll => switch (mode) {
    RollMode.advantage => rolls.reduce(max),
    RollMode.disadvantage => rolls.reduce(min),
    RollMode.normal => rolls.length == 1 ? rolls.first : 0,
  };

  bool get isNat20 => sides == 20 && _selectedRoll == 20;
  bool get isNat1 => sides == 20 && _selectedRoll == 1;

  int? get advantageRoll {
    if (mode == RollMode.normal) return null;
    return mode == RollMode.advantage ? rolls.reduce(min) : rolls.reduce(max);
  }
}

class DiceRollGroup {
  final List<DiceRoll> rolls;
  final DateTime timestamp;

  DiceRollGroup({
    required this.rolls,
    DateTime? timestamp,
  }) : timestamp = timestamp ?? DateTime.now();

  bool get isSingleRoll => rolls.length == 1;

  DiceRoll get firstRoll => rolls.first;

  int get totalSum => rolls.fold(0, (sum, roll) => sum + roll.total);

  List<int> get totals => rolls.map((r) => r.total).toList();

  String get notation {
    if (isSingleRoll) return firstRoll.diceNotation;
    return '${rolls.length}x ${firstRoll.diceNotation}';
  }

  bool get hasNat20 => rolls.any((r) => r.isNat20);
  bool get hasNat1 => rolls.any((r) => r.isNat1);
}
