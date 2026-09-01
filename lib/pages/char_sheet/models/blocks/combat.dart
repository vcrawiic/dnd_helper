class Combat {
  final int armorClass;
  final bool hasShield;
  final int speed;
  final int initiative;

  const Combat({
    this.armorClass = 10,
    this.hasShield = false,
    this.speed = 30,
    this.initiative = 0,
  });

  int get totalAC => armorClass + (hasShield ? 2 : 0);

  Combat copyWith({
    int? armorClass,
    bool? hasShield,
    int? speed,
    int? initiative,
  }) {
    return Combat(
      armorClass: armorClass ?? this.armorClass,
      hasShield: hasShield ?? this.hasShield,
      speed: speed ?? this.speed,
      initiative: initiative ?? this.initiative,
    );
  }
}
