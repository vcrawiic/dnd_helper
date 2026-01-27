class CharStats {
  // General Info
  final String name;
  final String race;
  final String characterClass;
  final String archetype;

  // Character Attributes
  final int strength;
  final int dexterity;
  final int constitution;
  final int intelligence;
  final int wisdom;
  final int charisma;

  // Battle Stats
  final int armorClass;
  final int shieldAC;
  final int speed;
  final int initiative;

  // Hit Points
  final int currentHp;
  final int maxHp;
  final int tempHp;

  // Experience and Level
  final int level;
  final int currentXp;

  // State and effects
  final int inspiration;
  final int exhaustion;
  final List<String> states;

  const CharStats({
    this.name = '',
    this.race = '',
    this.characterClass = '',
    this.archetype = '',
    this.strength = 10,
    this.dexterity = 10,
    this.constitution = 10,
    this.intelligence = 10,
    this.wisdom = 10,
    this.charisma = 10,
    this.armorClass = 10,
    this.shieldAC = 0,
    this.speed = 30,
    this.initiative = 0,
    this.currentHp = 10,
    this.maxHp = 10,
    this.tempHp = 0,
    this.level = 1,
    this.currentXp = 0,
    this.inspiration = 0,
    this.exhaustion = 0,
    this.states = const [],
  });

  // === Business-logic (computed properties) ===

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

  // === copyWith ===

  CharStats copyWith({
    String? name,
    String? race,
    String? characterClass,
    String? archetype,
    int? strength,
    int? dexterity,
    int? constitution,
    int? intelligence,
    int? wisdom,
    int? charisma,
    int? armorClass,
    int? shieldAC,
    int? speed,
    int? initiative,
    int? currentHp,
    int? maxHp,
    int? tempHp,
    int? level,
    int? currentXp,
    int? inspiration,
    int? exhaustion,
    List<String>? states,
  }) {
    return CharStats(
      name: name ?? this.name,
      race: race ?? this.race,
      characterClass: characterClass ?? this.characterClass,
      archetype: archetype ?? this.archetype,
      strength: strength ?? this.strength,
      dexterity: dexterity ?? this.dexterity,
      constitution: constitution ?? this.constitution,
      intelligence: intelligence ?? this.intelligence,
      wisdom: wisdom ?? this.wisdom,
      charisma: charisma ?? this.charisma,
      armorClass: armorClass ?? this.armorClass,
      shieldAC: shieldAC ?? this.shieldAC,
      speed: speed ?? this.speed,
      initiative: initiative ?? this.initiative,
      currentHp: currentHp ?? this.currentHp,
      maxHp: maxHp ?? this.maxHp,
      tempHp: tempHp ?? this.tempHp,
      level: level ?? this.level,
      currentXp: currentXp ?? this.currentXp,
      inspiration: inspiration ?? this.inspiration,
      exhaustion: exhaustion ?? this.exhaustion,
      states: states ?? this.states,
    );
  }
}
