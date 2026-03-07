import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dnd_helper/pages/char_sheet/models/char_stats_model.dart';
import 'blocks/general_info.dart';
import 'blocks/attributes.dart';
import 'blocks/combat.dart';
import 'blocks/hit_points.dart';
import 'blocks/progression.dart';
import 'blocks/conditions.dart';

class CharStatsMapper {
  CharStatsMapper._();

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

  static CharStats fromFirestore(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data();
    if (data == null) {
      return const CharStats();
    }
    return fromJson(data);
  }

  static Map<String, dynamic> toFirestore(CharStats stats) {
    return {...toJson(stats), 'updatedAt': FieldValue.serverTimestamp()};
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
