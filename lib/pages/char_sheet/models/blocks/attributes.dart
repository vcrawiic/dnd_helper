class Attributes {
  final int strength;
  final int dexterity;
  final int constitution;
  final int intelligence;
  final int wisdom;
  final int charisma;

  const Attributes({
    this.strength = 10,
    this.dexterity = 10,
    this.constitution = 10,
    this.intelligence = 10,
    this.wisdom = 10,
    this.charisma = 10,
  });

  int get strengthMod => (strength - 10) ~/ 2;
  int get dexterityMod => (dexterity - 10) ~/ 2;
  int get constitutionMod => (constitution - 10) ~/ 2;
  int get intelligenceMod => (intelligence - 10) ~/ 2;
  int get wisdomMod => (wisdom - 10) ~/ 2;
  int get charismaMod => (charisma - 10) ~/ 2;

  Attributes copyWith({
    int? strength,
    int? dexterity,
    int? constitution,
    int? intelligence,
    int? wisdom,
    int? charisma,
  }) {
    return Attributes(
      strength: strength ?? this.strength,
      dexterity: dexterity ?? this.dexterity,
      constitution: constitution ?? this.constitution,
      intelligence: intelligence ?? this.intelligence,
      wisdom: wisdom ?? this.wisdom,
      charisma: charisma ?? this.charisma,
    );
  }
}
