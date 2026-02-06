class Progression {
  final int level;
  final int currentXp;

  const Progression({this.level = 1, this.currentXp = 0});
  static const xpThresholds = {
    1: 0,
    2: 300,
    3: 900,
    4: 2700,
    5: 6500,
    6: 14000,
    7: 23000,
    8: 34000,
    9: 48000,
    10: 64000,
    11: 85000,
    12: 100000,
    13: 120000,
    14: 140000,
    15: 165000,
    16: 195000,
    17: 225000,
    18: 265000,
    19: 305000,
    20: 355000,
  };

  int get xpForCurrentLevel => xpThresholds[level] ?? 0;
  int get xpForNextLevel => xpThresholds[level + 1] ?? xpThresholds[20]!;
  bool get canLevelUp => level < 20 && currentXp >= xpForNextLevel;

  int get proficiencyBonus => ((level - 1) ~/ 4) + 2;

  Progression copyWith({
    int? level,
    int? currentXp,
  }) {
    return Progression(
      level: level ?? this.level,
      currentXp: currentXp ?? this.currentXp,
    );
  }
}
