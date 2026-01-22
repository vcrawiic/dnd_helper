class CharStats {
  final int strength;
  final int dexterity;
  final int constitution;
  final int intelligence;
  final int wisdom;
  final int charisma;

  final int currentHp;
  final int maxHp;
  final int tempHp;

  final int level;
  final int currentXp;

  const CharStats({
    this.strength = 10,
    this.dexterity = 10,
    this.constitution = 10,
    this.intelligence = 10,
    this.wisdom = 10,
    this.charisma = 10,
    this.currentHp = 10,
    this.maxHp = 10,
    this.tempHp = 0,
    this.level = 1,
    this.currentXp = 0,
  });

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

  CharStats copyWith({
    int? strength,
    int? dexterity,
    int? constitution,
    int? intelligence,
    int? wisdom,
    int? charisma,
    int? currentHp,
    int? maxHp,
    int? tempHp,
    int? level,
    int? currentXp,
  }) {
    return CharStats(
      strength: strength ?? this.strength,
      dexterity: dexterity ?? this.dexterity,
      constitution: constitution ?? this.constitution,
      intelligence: intelligence ?? this.intelligence,
      wisdom: wisdom ?? this.wisdom,
      charisma: charisma ?? this.charisma,
      currentHp: currentHp ?? this.currentHp,
      maxHp: maxHp ?? this.maxHp,
      tempHp: tempHp ?? this.tempHp,
      level: level ?? this.level,
      currentXp: currentXp ?? this.currentXp,
    );
  }
}
