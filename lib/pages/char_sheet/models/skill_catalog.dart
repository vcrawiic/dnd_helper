// Справочник характеристик и навыков (SRD, RU-подписи). Ключи навыков/спасбросков
// используются и для локального стейта, и как предполагаемый контракт бэка.

/// Модификатор характеристики по правилам D&D: floor((score - 10) / 2).
/// Важно: обычное `~/` в Dart округляет к нулю и даёт неверный результат для
/// нечётных значений ниже 10 (напр. 7 → -1 вместо -2), поэтому используем floor.
int abilityModifier(int score) => ((score - 10) / 2).floor();

/// Модификатор со знаком: «+3» / «-1» / «+0».
String fmtMod(int m) => m >= 0 ? '+$m' : '$m';

/// Порядок и подписи характеристик.
const List<String> kAbilityKeys = ['str', 'dex', 'con', 'int', 'wis', 'cha'];

const Map<String, String> kAbilityLabels = {
  'str': 'Сила',
  'dex': 'Ловкость',
  'con': 'Телосложение',
  'int': 'Интеллект',
  'wis': 'Мудрость',
  'cha': 'Харизма',
};

class SkillDef {
  final String key;
  final String label;
  final String ability;

  const SkillDef(this.key, this.label, this.ability);
}

const List<SkillDef> kSkills = [
  SkillDef('athletics', 'Атлетика', 'str'),
  SkillDef('acrobatics', 'Акробатика', 'dex'),
  SkillDef('sleight_of_hand', 'Ловкость рук', 'dex'),
  SkillDef('stealth', 'Скрытность', 'dex'),
  SkillDef('arcana', 'Магия', 'int'),
  SkillDef('history', 'История', 'int'),
  SkillDef('investigation', 'Анализ', 'int'),
  SkillDef('nature', 'Природа', 'int'),
  SkillDef('religion', 'Религия', 'int'),
  SkillDef('animal_handling', 'Уход за животными', 'wis'),
  SkillDef('insight', 'Проницательность', 'wis'),
  SkillDef('medicine', 'Медицина', 'wis'),
  SkillDef('perception', 'Восприятие', 'wis'),
  SkillDef('survival', 'Выживание', 'wis'),
  SkillDef('deception', 'Обман', 'cha'),
  SkillDef('intimidation', 'Запугивание', 'cha'),
  SkillDef('performance', 'Выступление', 'cha'),
  SkillDef('persuasion', 'Убеждение', 'cha'),
];

/// Навыки, относящиеся к характеристике (в порядке объявления).
List<SkillDef> skillsForAbility(String ability) =>
    kSkills.where((s) => s.ability == ability).toList();
