class GeneralInfo {
  final String name;
  final String race;
  final String characterClass;
  final String archetype;

  const GeneralInfo({
    this.name = '',
    this.race = '',
    this.characterClass = '',
    this.archetype = '',
  });

  GeneralInfo copyWith({
    String? name,
    String? race,
    String? characterClass,
    String? archetype,
  }) {
    return GeneralInfo(
      name: name ?? this.name,
      race: race ?? this.race,
      characterClass: characterClass ?? this.characterClass,
      archetype: archetype ?? this.archetype,
    );
  }
}
