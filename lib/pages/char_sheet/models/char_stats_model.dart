import 'blocks/general_info.dart';
import 'blocks/attributes.dart';
import 'blocks/combat.dart';
import 'blocks/hit_points.dart';
import 'blocks/progression.dart';
import 'blocks/conditions.dart';

class CharStats {
  final GeneralInfo generalInfo;
  final Attributes attributes;
  final Combat combat;
  final HitPoints hitPoints;
  final Progression progression;
  final Conditions conditions;

  const CharStats({
    this.generalInfo = const GeneralInfo(),
    this.attributes = const Attributes(),
    this.combat = const Combat(),
    this.hitPoints = const HitPoints(),
    this.progression = const Progression(),
    this.conditions = const Conditions(),
  });

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
  int get shieldAC => combat.shieldAC;
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
  }) {
    return CharStats(
      generalInfo: generalInfo ?? this.generalInfo,
      attributes: attributes ?? this.attributes,
      combat: combat ?? this.combat,
      hitPoints: hitPoints ?? this.hitPoints,
      progression: progression ?? this.progression,
      conditions: conditions ?? this.conditions,
    );
  }
}
