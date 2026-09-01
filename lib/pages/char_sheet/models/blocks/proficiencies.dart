/// Владения: наборы ключей навыков/спасбросков, которыми персонаж владеет.
/// [skills] — ключи навыков (см. skill_catalog), [expertise] — компетентность
/// (двойной бонус мастерства), [savingThrows] — ключи характеристик спасбросков.
class Proficiencies {
  final Set<String> skills;
  final Set<String> expertise;
  final Set<String> savingThrows;

  const Proficiencies({
    this.skills = const {},
    this.expertise = const {},
    this.savingThrows = const {},
  });

  bool hasSkill(String key) => skills.contains(key);
  bool hasExpertise(String key) => expertise.contains(key);
  bool hasSave(String ability) => savingThrows.contains(ability);

  Proficiencies copyWith({
    Set<String>? skills,
    Set<String>? expertise,
    Set<String>? savingThrows,
  }) {
    return Proficiencies(
      skills: skills ?? this.skills,
      expertise: expertise ?? this.expertise,
      savingThrows: savingThrows ?? this.savingThrows,
    );
  }

  /// Переключить наличие [key] в наборе — вернуть новый набор.
  static Set<String> toggled(Set<String> set, String key) {
    final next = Set<String>.from(set);
    next.contains(key) ? next.remove(key) : next.add(key);
    return next;
  }
}
