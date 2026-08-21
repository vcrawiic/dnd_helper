/// Краткая карточка персонажа для списка (из GET /api/characters).
class CharacterSummary {
  final int id;
  final String name;
  final String race;
  final String characterClass;
  final int level;
  final int hpCurrent;
  final int hpMax;

  CharacterSummary({
    required this.id,
    required this.name,
    required this.race,
    required this.characterClass,
    required this.level,
    required this.hpCurrent,
    required this.hpMax,
  });

  factory CharacterSummary.fromJson(Map<String, dynamic> json) {
    final classes = (json['classes'] as List<dynamic>?) ?? const [];
    final firstClass = classes.isNotEmpty
        ? classes.first as Map<String, dynamic>
        : null;

    return CharacterSummary(
      id: json['id'] as int,
      name: json['name'] as String? ?? '',
      race: json['race'] as String? ?? '',
      characterClass: firstClass?['name'] as String? ?? '',
      level: json['total_level'] as int? ?? 1,
      hpCurrent: json['hp_current'] as int? ?? 0,
      hpMax: json['hp_max'] as int? ?? 0,
    );
  }
}
