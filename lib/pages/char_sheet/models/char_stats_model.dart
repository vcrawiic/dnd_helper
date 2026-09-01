import 'blocks/general_info.dart';
import 'blocks/attributes.dart';
import 'blocks/combat.dart';
import 'blocks/hit_points.dart';
import 'blocks/progression.dart';
import 'blocks/conditions.dart';
import 'blocks/proficiencies.dart';
import 'skill_catalog.dart';

class CharStats {
  final GeneralInfo generalInfo;
  final Attributes attributes;
  final Combat combat;
  final HitPoints hitPoints;
  final Progression progression;
  final Conditions conditions;
  final Proficiencies proficiencies;

  const CharStats({
    this.generalInfo = const GeneralInfo(),
    this.attributes = const Attributes(),
    this.combat = const Combat(),
    this.hitPoints = const HitPoints(),
    this.progression = const Progression(),
    this.conditions = const Conditions(),
    this.proficiencies = const Proficiencies(),
  });

  /// Значение характеристики по ключу ('str'/'dex'/...).
  int abilityScore(String key) => switch (key) {
    'str' => attributes.strength,
    'dex' => attributes.dexterity,
    'con' => attributes.constitution,
    'int' => attributes.intelligence,
    'wis' => attributes.wisdom,
    'cha' => attributes.charisma,
    _ => 10,
  };

  /// Модификатор характеристики (учитывает floor для нечётных значений).
  int abilityMod(String key) => abilityModifier(abilityScore(key));

  /// Спасбросок = модификатор + бонус мастерства при владении.
  int savingThrow(String key) =>
      abilityMod(key) + (proficiencies.hasSave(key) ? proficiencyBonus : 0);

  /// Модификатор навыка = модификатор характеристики + бонус мастерства
  /// (двойной при компетентности).
  int skillMod(String skillKey) {
    final def = kSkills.firstWhere((s) => s.key == skillKey);
    var mod = abilityMod(def.ability);
    if (proficiencies.hasSkill(skillKey)) mod += proficiencyBonus;
    if (proficiencies.hasExpertise(skillKey)) mod += proficiencyBonus;
    return mod;
  }

  String get name => generalInfo.name;
  String get race => generalInfo.race;
  String get characterClass => generalInfo.characterClass;
  String get archetype => generalInfo.archetype;

  int get strength => attributes.strength;
  int get dexterity => attributes.dexterity;
  int get constitution => attributes.constitution;
  int get intelligence => attributes.intelligence;
  int get wisdom => attributes.wisdom;
  int get charisma => attributes.charisma;

  int get armorClass => combat.armorClass;
  int get shieldAC => combat.hasShield ? 2 : 0;
  int get speed => combat.speed;
  int get initiative => combat.initiative;

  int get currentHp => hitPoints.current;
  int get maxHp => hitPoints.max;
  int get tempHp => hitPoints.temp;

  int get level => progression.level;
  int get currentXp => progression.currentXp;
  int get xpForCurrentLevel => progression.xpForCurrentLevel;
  int get xpForNextLevel => progression.xpForNextLevel;
  bool get canLevelUp => progression.canLevelUp;
  int get proficiencyBonus => progression.proficiencyBonus;

  int get inspiration => conditions.inspiration;
  int get exhaustion => conditions.exhaustion;
  List<String> get states => conditions.states;

  CharStats copyWith({
    GeneralInfo? generalInfo,
    Attributes? attributes,
    Combat? combat,
    HitPoints? hitPoints,
    Progression? progression,
    Conditions? conditions,
    Proficiencies? proficiencies,
  }) {
    return CharStats(
      generalInfo: generalInfo ?? this.generalInfo,
      attributes: attributes ?? this.attributes,
      combat: combat ?? this.combat,
      hitPoints: hitPoints ?? this.hitPoints,
      progression: progression ?? this.progression,
      conditions: conditions ?? this.conditions,
      proficiencies: proficiencies ?? this.proficiencies,
    );
  }
}
