import 'package:dnd_helper/pages/char_sheet/models/char_stats_model.dart';
import 'blocks/general_info.dart';
import 'blocks/attributes.dart';
import 'blocks/combat.dart';
import 'blocks/hit_points.dart';
import 'blocks/progression.dart';
import 'blocks/conditions.dart';
import 'blocks/proficiencies.dart';

class CharStatsMapper {
  CharStatsMapper._();

  /// Набор ключей владений из ответа бэка. Терпимо к разным форматам:
  /// список ключей `["athletics"]`, либо map `{athletics: true}` /
  /// `{athletics: {proficient: true, expertise: false}}` (JSONB).
  /// ПРЕДПОЛОЖЕНИЕ по контракту — проверить по логам, правится здесь.
  static Set<String> _profSet(dynamic raw, {bool expertise = false}) {
    if (raw is List) {
      return expertise ? <String>{} : raw.map((e) => e.toString()).toSet();
    }
    if (raw is Map) {
      return raw.entries
          .where((e) {
            final v = e.value;
            if (v is bool) return !expertise && v;
            if (v is Map) {
              return v[expertise ? 'expertise' : 'proficient'] == true;
            }
            return false;
          })
          .map((e) => e.key.toString())
          .toSet();
    }
    return <String>{};
  }

  static CharStats fromJson(Map<String, dynamic> json) {
    if (json.containsKey('name') && !json.containsKey('generalInfo')) {
      return _fromLegacyJson(json);
    }

    return CharStats(
      generalInfo: _generalInfoFromJson(
        json['generalInfo'] as Map<String, dynamic>?,
      ),
      attributes: _attributesFromJson(
        json['attributes'] as Map<String, dynamic>?,
      ),
      combat: _combatFromJson(json['combat'] as Map<String, dynamic>?),
      hitPoints: _hitPointsFromJson(json['hitPoints'] as Map<String, dynamic>?),
      progression: _progressionFromJson(
        json['progression'] as Map<String, dynamic>?,
      ),
      conditions: _conditionsFromJson(
        json['conditions'] as Map<String, dynamic>?,
      ),
    );
  }

  static Map<String, dynamic> toJson(CharStats stats) {
    return {
      'generalInfo': _generalInfoToJson(stats.generalInfo),
      'attributes': _attributesToJson(stats.attributes),
      'combat': _combatToJson(stats.combat),
      'hitPoints': _hitPointsToJson(stats.hitPoints),
      'progression': _progressionToJson(stats.progression),
      'conditions': _conditionsToJson(stats.conditions),
    };
  }

  /// CharStats → JSON для PUT /api/characters/:id.
  static Map<String, dynamic> toBackendJson(CharStats s) {
    return {
      'name': s.generalInfo.name,
      'race': s.generalInfo.race,
      'classes': [
        {
          'name': s.generalInfo.characterClass,
          'subclass': s.generalInfo.archetype,
          'level': s.progression.level,
        },
      ],
      'total_level': s.progression.level,
      'ability_scores': {
        'str': s.attributes.strength,
        'dex': s.attributes.dexterity,
        'con': s.attributes.constitution,
        'int': s.attributes.intelligence,
        'wis': s.attributes.wisdom,
        'cha': s.attributes.charisma,
      },
      'hp_max': s.hitPoints.max,
      'hp_current': s.hitPoints.current,
      'hp_temp': s.hitPoints.temp,
      'hp_max_bonus': s.hitPoints.maxBonus,
      'hit_dice': {'values': s.hitPoints.hitDice},
      'armor_class': s.combat.armorClass,
      'has_shield': s.combat.hasShield,
      'speed': s.combat.speed,
      'xp': s.progression.currentXp,
      'inspiration': s.conditions.inspiration,
      'exhaustion': s.conditions.exhaustion,
      'states': s.conditions.states,
      // Владения — списки ключей (ПРЕДПОЛОЖЕНИЕ по контракту, см. _profSet).
      'skills': s.proficiencies.skills.toList(),
      'expertise': s.proficiencies.expertise.toList(),
      'saving_throws': s.proficiencies.savingThrows.toList(),
    };
  }

  /// JSON из GET /api/characters/:id → CharStats.
  static CharStats fromBackendJson(Map<String, dynamic> json) {
    final classes = (json['classes'] as List<dynamic>?) ?? const [];
    final firstClass = classes.isNotEmpty
        ? classes.first as Map<String, dynamic>
        : null;

    final abilities = (json['ability_scores'] as Map<String, dynamic>?) ?? {};
    int ability(String key) {
      final v = abilities[key];
      if (v is int) return v;
      // fallback: вложенный формат {final: {str: ...}} после генерации на бэке.
      final fin = abilities['final'];
      if (fin is Map && fin[key] is int) return fin[key] as int;
      return 10;
    }

    final hitDiceRaw = json['hit_dice'];
    final hitDice = (hitDiceRaw is Map && hitDiceRaw['values'] is List)
        ? (hitDiceRaw['values'] as List).map((e) => e as int).toList()
        : <int>[];

    return CharStats(
      generalInfo: GeneralInfo(
        name: json['name'] as String? ?? '',
        race: json['race'] as String? ?? '',
        characterClass: firstClass?['name'] as String? ?? '',
        archetype: firstClass?['subclass'] as String? ?? '',
      ),
      attributes: Attributes(
        strength: ability('str'),
        dexterity: ability('dex'),
        constitution: ability('con'),
        intelligence: ability('int'),
        wisdom: ability('wis'),
        charisma: ability('cha'),
      ),
      combat: Combat(
        armorClass: json['armor_class'] as int? ?? 10,
        hasShield: json['has_shield'] as bool? ?? false,
        speed: json['speed'] as int? ?? 30,
        initiative: json['initiative'] as int? ?? 0,
      ),
      hitPoints: HitPoints(
        current: json['hp_current'] as int? ?? 10,
        max: json['hp_max'] as int? ?? 10,
        temp: json['hp_temp'] as int? ?? 0,
        maxBonus: json['hp_max_bonus'] as int? ?? 0,
        hitDice: hitDice,
      ),
      progression: Progression(
        level: json['total_level'] as int? ?? 1,
        currentXp: json['xp'] as int? ?? 0,
      ),
      conditions: Conditions(
        inspiration: json['inspiration'] as int? ?? 0,
        exhaustion: json['exhaustion'] as int? ?? 0,
        states:
            (json['states'] as List<dynamic>?)
                ?.map((e) => e as String)
                .toList() ??
            [],
      ),
      proficiencies: Proficiencies(
        skills: _profSet(json['skills']),
        expertise: _profSet(json['expertise'])
          ..addAll(_profSet(json['skills'], expertise: true)),
        savingThrows: _profSet(json['saving_throws']),
      ),
    );
  }

  static GeneralInfo _generalInfoFromJson(Map<String, dynamic>? json) {
    if (json == null) return const GeneralInfo();
    return GeneralInfo(
      name: json['name'] as String? ?? '',
      race: json['race'] as String? ?? '',
      characterClass: json['characterClass'] as String? ?? '',
      archetype: json['archetype'] as String? ?? '',
    );
  }

  static Map<String, dynamic> _generalInfoToJson(GeneralInfo info) {
    return {
      'name': info.name,
      'race': info.race,
      'characterClass': info.characterClass,
      'archetype': info.archetype,
    };
  }

  static Attributes _attributesFromJson(Map<String, dynamic>? json) {
    if (json == null) return const Attributes();
    return Attributes(
      strength: json['strength'] as int? ?? 10,
      dexterity: json['dexterity'] as int? ?? 10,
      constitution: json['constitution'] as int? ?? 10,
      intelligence: json['intelligence'] as int? ?? 10,
      wisdom: json['wisdom'] as int? ?? 10,
      charisma: json['charisma'] as int? ?? 10,
    );
  }

  static Map<String, dynamic> _attributesToJson(Attributes attrs) {
    return {
      'strength': attrs.strength,
      'dexterity': attrs.dexterity,
      'constitution': attrs.constitution,
      'intelligence': attrs.intelligence,
      'wisdom': attrs.wisdom,
      'charisma': attrs.charisma,
    };
  }

  static Combat _combatFromJson(Map<String, dynamic>? json) {
    if (json == null) return const Combat();
    return Combat(
      armorClass: json['armorClass'] as int? ?? 10,
      hasShield: json['hasShield'] as bool? ?? false,
      speed: json['speed'] as int? ?? 30,
      initiative: json['initiative'] as int? ?? 0,
    );
  }

  static Map<String, dynamic> _combatToJson(Combat combat) {
    return {
      'armorClass': combat.armorClass,
      'hasShield': combat.hasShield,
      'speed': combat.speed,
      'initiative': combat.initiative,
    };
  }

  static HitPoints _hitPointsFromJson(Map<String, dynamic>? json) {
    if (json == null) return const HitPoints();
    return HitPoints(
      current: json['current'] as int? ?? 10,
      max: json['max'] as int? ?? 10,
      temp: json['temp'] as int? ?? 0,
      maxBonus: json['maxBonus'] as int? ?? 0,
      hitDice:
          (json['hitDice'] as List<dynamic>?)?.map((e) => e as int).toList() ??
          [],
    );
  }

  static Map<String, dynamic> _hitPointsToJson(HitPoints hp) {
    return {
      'current': hp.current,
      'max': hp.max,
      'temp': hp.temp,
      'maxBonus': hp.maxBonus,
      'hitDice': hp.hitDice,
    };
  }

  static Progression _progressionFromJson(Map<String, dynamic>? json) {
    if (json == null) return const Progression();
    return Progression(
      level: json['level'] as int? ?? 1,
      currentXp: json['currentXp'] as int? ?? 0,
    );
  }

  static Map<String, dynamic> _progressionToJson(Progression prog) {
    return {'level': prog.level, 'currentXp': prog.currentXp};
  }

  static Conditions _conditionsFromJson(Map<String, dynamic>? json) {
    if (json == null) return const Conditions();
    return Conditions(
      inspiration: json['inspiration'] as int? ?? 0,
      exhaustion: json['exhaustion'] as int? ?? 0,
      states:
          (json['states'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
    );
  }

  static Map<String, dynamic> _conditionsToJson(Conditions cond) {
    return {
      'inspiration': cond.inspiration,
      'exhaustion': cond.exhaustion,
      'states': cond.states,
    };
  }

  static CharStats _fromLegacyJson(Map<String, dynamic> json) {
    return CharStats(
      generalInfo: GeneralInfo(
        name: json['name'] as String? ?? '',
        race: json['race'] as String? ?? '',
        characterClass: json['characterClass'] as String? ?? '',
        archetype: json['archetype'] as String? ?? '',
      ),
      attributes: Attributes(
        strength: json['strength'] as int? ?? 10,
        dexterity: json['dexterity'] as int? ?? 10,
        constitution: json['constitution'] as int? ?? 10,
        intelligence: json['intelligence'] as int? ?? 10,
        wisdom: json['wisdom'] as int? ?? 10,
        charisma: json['charisma'] as int? ?? 10,
      ),
      combat: Combat(
        armorClass: json['armorClass'] as int? ?? 10,
        hasShield: json['hasShield'] as bool? ?? false,
        speed: json['speed'] as int? ?? 30,
        initiative: json['initiative'] as int? ?? 0,
      ),
      hitPoints: HitPoints(
        current: json['currentHp'] as int? ?? 10,
        max: json['maxHp'] as int? ?? 10,
        temp: json['tempHp'] as int? ?? 0,
      ),
      progression: Progression(
        level: json['level'] as int? ?? 1,
        currentXp: json['currentXp'] as int? ?? 0,
      ),
      conditions: Conditions(
        inspiration: json['inspiration'] as int? ?? 0,
        exhaustion: json['exhaustion'] as int? ?? 0,
        states:
            (json['states'] as List<dynamic>?)
                ?.map((e) => e as String)
                .toList() ??
            [],
      ),
    );
  }
}
